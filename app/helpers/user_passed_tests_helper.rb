module UserPassedTestsHelper
  def result_message(rate)
    rate.to_i >= UserPassedTest::SUCCESS_RATE ? 'passed' : 'failed'
  end
end
