class BadgeRule < ApplicationRecord
  RULES = %w[
    manual
    first_try_success
    all_in_level
    all_in_category
  ].freeze

  def self.list
    RULES
  end

  has_one :badge

  validates :rule, inclusion: RULES
end
