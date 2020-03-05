# frozen_string_literal: true
class Test < ApplicationRecord
  # один тест связан с 1 категорией
  belongs_to :category
  # у теста есть свой автор из класса Юзер
  belongs_to :author, class_name: 'User'
  # у одного теста много вопросов
  has_many :questions, dependent: :destroy
  # несколько тестов могут проходить юзеры
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages




  def self.sort_by_category(category_title)
    joins(:category)
        .where(categories: { title: category_title })
        .order(title: :desc)
        .pluck(:title)
  end
end
