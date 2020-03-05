class User < ApplicationRecord
  # несколько юзеров проходят тесты
  has_many :test_passages
  has_many :tests, through: :test_passages



  def by_level(level)
    Test.joins('join test_passages on test_passages.test_id = tests.id')
        .where(test_passages: { user_id: id }, tests: { level: level })
  end
end
