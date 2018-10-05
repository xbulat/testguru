class AddAuthorIdToTest < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :user, foreign_key: true
    change_column_null(:tests, :user_id, false)
  end
end
