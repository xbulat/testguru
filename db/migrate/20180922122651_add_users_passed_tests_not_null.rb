class AddUsersPassedTestsNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:user_passed_tests, :user_id, false)
    change_column_null(:user_passed_tests, :test_id, false)
  end
end
