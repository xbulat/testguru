module UserPassedTestsHelper
  def result_text_color(rate)
    rate.to_i >= UserPassedTest::SUCCESS_RATE ? 'passed' : 'failed'
  end
end
