class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  # несколько юзеров проходят тесты
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  # Юзер может создать несколько тестов
  has_many :tests_created, class_name: 'Test', foreign_key: :author_id, dependent: :nullify

  validates :email, presence: true, format: /.+@.+\..{2,}/, uniqueness: true

  def by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
