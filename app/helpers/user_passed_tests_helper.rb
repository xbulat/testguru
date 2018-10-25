module UserPassedTestsHelper
  def result_message(user_passed_test)
    user_passed_test.success? ? 'Test was passed!' : 'Test was failed!'
  end

  def result_css_style(user_passed_test)
    user_passed_test.success? ? 'passed' : 'failed'
  end
end
