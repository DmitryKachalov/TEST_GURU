class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      BadgeControlService.new(@test_passage).call

      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
    render :show
    end
  end

  def gist
    result = GistQuestionService
                 .new(current_user, @test_passage.current_question)
                 .call
    if result.success?
      flash[:notice] = "#{t('.success')} #{result.html_link}"
    else
      flash[:alert] = "#{t('.failure')}: #{result.message}"
    end
    redirect_to @test_passage
  end


  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
