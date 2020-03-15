class Category < ApplicationRecord
  default_scope { order(title: :asc) }
  # одной категории принадлежит 1 и более тестов
  has_many :tests, dependent: :nullify

  validates :title, presence: true
end
