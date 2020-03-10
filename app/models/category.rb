class Category < ApplicationRecord
  # одной категории принадлежит 1 и более тестов
  has_many :tests, dependent: :nullify

  validates :title, presence: true

  default_scope { order(title: :asc) }
end
