class CompleteCategoryRule < Rule
  def set_filter_value(filter_value)
    category = Category.find_by(title: filter_value)
    self.filter_value = category.id
  end

  def meets?(test_passage)
    return false unless test_passage.passed?
    return false unless test_passage.test.category != filter_value

    passed_test_counts = calc_passed_tests(test_passage.user)
    all_tests = Test.with_category(filter_value)
    achieved_times = test_passage.user.badges.with_rule(self).size

    passed_test_counts.size == all_tests.size &&
        achieved_times < passed_test_counts.values.min
  end

  private

  def calc_passed_tests(user)
    user.test_passages
        .passed
        .with_category(filter_value)
        .inject(Hash.new(0)) { |hash, test| hash[test] += 1; hash }
  end
end
