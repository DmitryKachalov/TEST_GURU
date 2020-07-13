class BadgesService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def new_badges
    return [] unless @test_passage.passed

    Rule.all
        .filter { |rule| rule.meets?(@test_passage) }
        .map { |rule| rule.badge }
  end
end
