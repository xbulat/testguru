class CreateBadgeRules < ActiveRecord::Migration[5.2]
  def change
    create_table :badge_rules do |t|
      t.string :rule
      t.string :argument
      t.text   :description

      t.timestamps
    end
  end
end
