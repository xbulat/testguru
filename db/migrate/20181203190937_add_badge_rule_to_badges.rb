class AddBadgeRuleToBadges < ActiveRecord::Migration[5.2]
  def change
    add_reference :badges, :badge_rule, foreign_key: true
  end
end
