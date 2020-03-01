class User < ApplicationRecord
  def by_level(level)
    Test.joins('join test_passages on test_passages.test_id = tests.id')
        .where('test_passages.user_id = ? and tests.level = ?', self.id, level)
  end
end
