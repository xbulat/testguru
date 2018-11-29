class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.string :title
      t.text :body
      t.references :user, foreign_key: true
    end
  end
end
