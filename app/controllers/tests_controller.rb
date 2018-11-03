class TestsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])
    current_user.tests.push(@test)
    redirect_to current_user.user_passed_test(@test)
  end

  private

  def rescue_with_test_not_found
    render inline: t('errors.tests.not_found'), status: 404
  end
end
