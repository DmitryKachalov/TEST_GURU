class FirstAttemptRule < Rule
  def meets?(test_passage)
    return false unless test_passage.passed?

    TestPassage.where(user: test_passage.user, test: test_passage.test).count == 1
  end
end
