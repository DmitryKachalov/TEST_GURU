class Category < ApplicationRecord
  # одной категории принадлежит 1 и более тестов
  has_many :tests, dependent: :nullify
end
