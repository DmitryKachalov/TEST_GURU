class TestsController < ApplicationController
  before_action :find_test, only: %i[show]
  #/tests?level=2&lang=ru

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  def index
    # result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    #
    # render plain: result.join("\n")


    #render html: '<h1>All tests</h1>'.html_safe
    #
    #render json: { tests: [] }
    #render json: { tests: Test.all }

    #render inline: '<p>My favorite language is: <%= %[ybuR].reverse! %>!</p>'

    #head :no_content
    # byebug
    # render plain: 'All tests'

    #render inline: '<%= console %>'
    #
    # logger.info(self.object_id)
    # respond_to do |format|
    #   format.html { render plain: 'All tests' }
    #   format.json { render json: {tests: Test.all } }
    #end
  end

  def show
    # title = Test.first.title
    # render inline: '<%= title %>'
    #
    render inline: '<%= @test.title %>'
  end
  #
  # def new
  #
  # end
  #
  # def create
  #   # result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
  #   #
  #   # render plain: result.join("\n")
  #   test = Test.create(test_params)
  #
  #   render plain: test.inspect
  # end
  #
  # def search
  #   result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
  #
  #   render plain: result.join("\n")
  # end
  #
   private
  #
  # def test_params
  #   params.require(:test).permit(:title, :level)
  # end
  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end
end
