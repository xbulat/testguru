class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :title, null: false, unique: true
      t.string :image, null: false
      t.text   :description

      t.timestamps
    end
  end
end
