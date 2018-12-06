class BadgeRuleService
  def self.rules
    self.private_instance_methods.grep(/rule_/)
  end

  def initialize(user_passed_test)
    @user_attempt = user_passed_test
    @user = user_passed_test.user
    @rules = BadgeRule.all
  end

  def check_awards
    @rules.map do |r|
      r.badge if @user_attempt.success? && send(r.rule, r.argument)
    end.compact
  end

  private

  def rule_manual(_)
    false
  end

  def rule_first_try_success(_)
    @user.test_ids.count(@user_attempt.test_id) == 1
  end

  def rule_all_in_level(level)
    @user.passed_by_level(level).select(:id).order(id: :asc).uniq.map(&:id) == Test.by_level(level).select(:id).order(id: :asc).ids
  end

  def rule_all_in_category(category)
    @user.passed_by_category(category).select(:id).order(id: :asc).uniq.map(&:id) == Test.by_category(category).select(:id).order(id: :asc).ids
  end
end
