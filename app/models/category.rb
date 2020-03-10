class Category < ApplicationRecord
  # одной категории принадлежит 1 и более тестов
  has_many :tests, dependent: :nullify

  default_scope { order(title: :asc) }
end
