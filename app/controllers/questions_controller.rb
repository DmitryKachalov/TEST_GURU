class QuestionsController < ApplicationController

  before_action :find_test, only: [:new, :create, :index]
  before_action :find_question, only: :show
  skip_before_action :verify_authenticity_token

  def index
    @questions = @test.questions
  end

  def show; end

  def new
    @test
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to test_question_path(@test, @question)
    else
      render plain: 'Aborted'
    end
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



end


