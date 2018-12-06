class BadgeRule < ApplicationRecord
  RULES = %w[
    rule_manual
    rule_first_try_success
    rule_all_in_level
    rule_all_in_category
  ].freeze

  def self.list
    RULES
  end

  has_one :badge

  validate :validate_rules

  private

  def validate_rules
    errors.add(:base, 'Rule must be exist') unless RULES.member?(self.rule)
  end
end
