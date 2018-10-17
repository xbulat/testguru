class QuestionsController < ApplicationController
  before_action :find_parent_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :rescue_with_invalid_record

  def index; end

  def show; end

  def new; end

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
    params.require(:question).permit(:body)
  end

  def find_parent_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render inline: "Question not found [404]"
  end

  def rescue_with_invalid_record
    render inline: "Cannot commit record [402]"
  end
end
