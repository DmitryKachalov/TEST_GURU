class CompleteLevelRule < Rule
  def set_filter_value(filter_value)
    self.filter_value = filter_value.to_i
  end

  def meets?(test_passage)
    return false unless test_passage.passed?
    return false if test_passage.test.level != filter_value

    passed_test_counts = calc_passed_tests(test_passage.user)
    all_tests = Test.with_level(filter_value)
    achieved_times = test_passage.user.badges.with_rule(self).size

    passed_test_counts.size == all_tests.size &&
        achieved_times < passed_test_counts.values.min
  end

  private

  def calc_passed_tests(user)
    user.test_passages
        .passed
        .with_level(filter_value)
        .inject(Hash.new(0)) { |hash, test| hash[test] += 1; hash }
  end
end
