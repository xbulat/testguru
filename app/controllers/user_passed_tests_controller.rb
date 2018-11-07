class UserPassedTestsController < ApplicationController
  before_action :find_user_passed_test, only: %i[show update result gist]
  after_action :create_gist, only: :gist, if: -> { @result.id }

  def show; end

  def result; end

  def update
    @user_passed_test.accept!(params[:answer_ids])

    if @user_passed_test.completed?
      redirect_to result_user_passed_test_path(@user_passed_test)
    else
      render :show
    end
  end

  def gist
    @result = GistQuestionService.new(@user_passed_test.current_question).call
    redirect_to @user_passed_test, flash_options
  end

  private

  def find_user_passed_test
    @user_passed_test = UserPassedTest.find(params[:id])
  end

  def create_gist
    Gist.create!(question: @user_passed_test.current_question,
                 user: current_user,
                 mash: @result.id)
  end

  def flash_options
    if @result.id
      { notice: t('.success',  url: view_context.link_to('gist.github.com', @result.html_url, target: :blank)) }
    else
      { alert: t('.failure') }
    end
  end
end
