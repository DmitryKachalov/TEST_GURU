class User < ApplicationRecord
  # несколько юзеров проходят тесты
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  # Юзер может создать несколько тестов
  has_many :tests_created, class_name: 'Test', foreign_key: :author_id, dependent: :nullify

  def by_level(level)
    tests.where(level: level)
  end
end
