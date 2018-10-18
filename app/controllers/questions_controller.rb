class QuestionsController < ApplicationController
  before_action :find_parent_test, only: %i[index new]
  before_action :find_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :rescue_with_invalid_record

  def index; end

  def show; end

  def edit; end

  def new
    @question = @test.question.new
  end

  def update
    @question.update!(resource_params)
    redirect_to test_path @question.test
  end

  def create
    @question = Question.new(resource_params)
    if @question.save
      redirect_to @question.test
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to test_path @question.test
  end

  private

  def resource_params
    params.require(:question).permit(:body, :test_id)
  end

  def find_parent_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render inline: 'Question not found [404]', status: 404
  end

  def rescue_with_invalid_record
    render inline: 'Cannot commit record [402]'
  end
end
