class UserPassedTestsController < ApplicationController
  before_action :find_user_passed_test, only: %i[show update result gist]

  def show; end

  def result
    awards = BadgeRuleService.new(@user_passed_test).check_defined_rules

    flash.now[:notice] = t('.new_awards') if awards.any?
  end

  def update
    @user_passed_test.accept!(params[:answer_ids])

    if @user_passed_test.completed?
      redirect_to result_user_passed_test_path(@user_passed_test)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@user_passed_test.current_question).call

    flash_options = if result.success?
                      current_user.gists.create!(question: @user_passed_test.current_question,
                                                 url: result.html_url)

                      { notice: t('.success',
                        url: view_context.link_to('gist.github.com',
                        result.html_url,
                        target: :blank)) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @user_passed_test, flash_options
  end

  private

  def find_user_passed_test
    @user_passed_test = UserPassedTest.find(params[:id])
  end
end
