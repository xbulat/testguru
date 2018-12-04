class BadgeRuleService
  def self.rules
    self.private_instance_methods.grep(/rule_/)
  end

  def initialize(user_passed_test)
    @upt = user_passed_test
    @rules = BadgeRule.all
    @awards = []
  end

  def check_defined_rules
    @rules.each do |rule|
      result = method(rule.method).call(rule.argument)

      if result
        @upt.user.user_badges.create!(badge: rule.badge)
        @awards << rule.badge.id
      end
    end

    @awards
  end

  private

  def rule_manual(_)
    false
  end

  def rule_first_try_success(_)
    @upt.success? && @upt.user.test_ids.count(@upt.test_id) == 1
  end

  def rule_all_in_level(level)
    @upt.success? && @upt.user.passed_by_level(level).ids.uniq.sort == Test.by_level(level).ids.sort
  end

  def rule_all_in_category(category)
    @upt.success? && @upt.user.passed_by_category(category).ids.uniq.sort == Test.by_category(category).ids.sort
  end
end
