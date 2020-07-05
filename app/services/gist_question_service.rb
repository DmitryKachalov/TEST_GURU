class GistQuestionService
  include AbstractController::Translation

  def initialize(user, question, client: default_client)
    @user = user
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    begin
      result = @client.create_gist(gist_params)
      if result.html_url.nil?
        GistCallFailure.new(t('test_passages.gist.failure'))
      else
        save_gist!(result)
        GistCallSuccess.new(result.html_url)
      end
    rescue Octokit::Error => e
      GistCallFailure.new(e.message)
    end
  end

  private

  def gist_params
    {
        description: "#{t('test_passages.gist.question_title')} '#{@test.title}'",
        files: {
            'question.txt' => {
                content: gist_content
            }
        }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join('\n')
  end

  def default_client
    Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end

  def save_gist!(result)
    Gist.new(hash_id: result.id,
             gist_url: result.html_url,
             question: @question,
             user: @user).save!
  end
end
