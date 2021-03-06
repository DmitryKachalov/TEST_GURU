class BadgeControlService

  RULE_TYPES = %w[all_in_category first_try all_in_level].freeze


  def initialize(test_passage)
    @test = test_passage.test
    @user = test_passage.user
  end

  def call
    @user.badges << select_badges
  end

  def select_badges
    Badge.all.select do |badge|
      send(badge.control, badge.control_param)
    end
  end

  def user_tests
    @user.test_passages.where(passed: true)
  end

  private

  def all_in_category(category_name)
    return false if @test.category.title != category_name

    successful_tests_count = successful_tests_in_category.uniq.count

    return false unless successful_tests_count.positive?

    Test.by_category(@test.category.title).uniq.count == successful_tests_count
  end

  def first_try(test)
    return false if @test.title != test

    @user.test_passages.where(test_id: @test.id).where('success = ?', true).count == 1
  end

  def all_in_level(level)
    return false if @test.level != level.to_i

    successful_tests_count = successful_tests_on_level.uniq.count
    return false unless successful_tests_count.positive?

    Test.by_level(@test.level).uniq.count == successful_tests_count
  end


  def successful_tests_in_category
    badge = @user.badges.where(control: "all_in_category").last

    scope = successful_tests.where(category_id: @test.category.id)

    badged_tests(badge, scope)
  end

  def successful_tests_on_level
    badge = @user.badges.where(control: "all_in_level").last

    scope = successful_tests.where(level: @test.level)

    badged_tests(badge, scope)
  end

  def badged_tests(badge, scope)
    if badge
      badge_users = BadgeUser.where(user_id: @user.id, badge_id: badge.id).last
      scope.where("test_passages.created_at > ?", badge_users.created_at)
    else
      scope
    end
  end

  def successful_tests
    @user.tests.merge(TestPassage.where('success = ?', true))
  end
end

