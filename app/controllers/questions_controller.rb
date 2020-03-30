class QuestionsController < ApplicationController

  before_action :find_test, only: %i[new create index]
  before_action :find_question, only: %i[show destroy]
  skip_before_action :verify_authenticity_token


  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  def index
    @questions = @test.questions
  end

  def show; end

  def new
    @question = @test.questions.new
  end

  def edit
    @question
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to test_question_path
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

end


