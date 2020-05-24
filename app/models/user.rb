class User < ApplicationRecord

  # несколько юзеров проходят тесты
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  # Юзер может создать несколько тестов
  has_many :tests_created, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  has_many :gists, dependent: :destroy
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  def by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def admin?
    is_a?(Admin)
  end
end
