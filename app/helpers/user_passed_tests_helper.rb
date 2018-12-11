module UserPassedTestsHelper
  def result_message(user_passed_test)
    user_passed_test.success? ? t('user_passed_tests.result.passed') : t('user_passed_tests.result.failed')
  end

  def result_css_style(user_passed_test)
    user_passed_test.success? ? 'alert-success' : 'alert-danger'
  end

  def minutes_left(seconds)
    (Time.mktime(0)+seconds).strftime("%M:%S")
  end
end
