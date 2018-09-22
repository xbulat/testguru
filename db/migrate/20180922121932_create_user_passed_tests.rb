class CreateUserPassedTests < ActiveRecord::Migration[5.2]
  def change
    create_table :user_passed_tests do |t|
      t.references :user, foreign_key: true, index: true
      t.references :test, foreign_key: true, index: true
      t.timestamps
    end
  end
end
