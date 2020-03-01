# frozen_string_literal: true
class Test < ApplicationRecord
  def self.sort_by_category(category_title)
    joins('join categories on tests.category_id = categories.id')
        .where(categories: { title: category_title })
        .order(title: :desc)
        .pluck(:title)
  end
end
