# frozen_string_literal: true
class Test < ApplicationRecord
  # один тест связан с 1 категорией
  belongs_to :category
  # у одного теста много вопросов
  has_many :questions




  def self.sort_by_category(category_title)
    joins('join categories on tests.category_id = categories.id')
        .where(categories: { title: category_title })
        .order(title: :desc)
        .pluck(:title)
  end
end
