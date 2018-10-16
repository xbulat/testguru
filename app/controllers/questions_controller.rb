class QuestionsController < ApplicationController
  before_action :find_parent_test
  before_action :find_question , only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :rescue_with_invalid_record

  attr_reader :test, :question

  def index
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new

  end

  def create
    @test.question.create!(resource_params)
    redirect_to @test
  end

  def destroy
    @question.destroy
    render inline: "Question was deleted"
  end

  private
  def resource_params
    columns = %i(body)
    params.require(:question).permit(*columns)
  end

  def find_parent_test
    @test = Test.find_by(params[:test_id])
  end

  def find_question
    @question = test.question.find(params[:id])
  end

  def rescue_with_question_not_found
    render inline: "Question not found [404]"
  end

  def rescue_with_invalid_record
    render inline: "Cannot commit record [5xx]"
  end
end
