class Admin::QuestionsController < Admin::BaseController
  before_action :find_parent_test, only: %i[new create]
  before_action :find_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :rescue_with_invalid_record

  def show; end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(resource_params)
    if @question.save
      redirect_to admin_test_path(@question.test), notice: t('.notice')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(resource_params)
      redirect_to admin_test_path(@question.test), notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test), notice: t('.notice')
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
    render inline: t('errors.questions.not_found'), status: 404
  end

  def rescue_with_invalid_record
    render inline: t('errors.invalid_record')
  end
end
