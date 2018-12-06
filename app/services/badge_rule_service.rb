class BadgeRuleService
  def initialize(user_passed_test)
    @user_attempt = user_passed_test
    @user = user_passed_test.user
    @badges = Badge.includes(:badge_rule)
  end

  def check_awards
    return [] unless @user_attempt.success?
    @badges.select { |b| send("rule_#{b.badge_rule.rule}", b.badge_rule.argument) }
  end

  private

  def rule_manual(_)
    false
  end

  def rule_first_try_success(_)
    @user.test_ids.count(@user_attempt.test_id) == 1
  end

  def rule_all_in_level(level)
    @user.passed_by_level(level).select(:id).order(id: :asc).uniq.pluck(:id) == Test.by_level(level).order(id: :asc).ids
  end

  def rule_all_in_category(category)
    @user.passed_by_category(category).select(:id).order(id: :asc).uniq.pluck(:id) == Test.by_category(category).order(id: :asc).ids
  end
end
