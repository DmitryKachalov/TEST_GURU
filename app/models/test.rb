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

  validates :title, presence: true,
            uniqueness: { scope: :level,
                          message: 'Title and Level must be unique' }
  validates :level, :time_limit, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  default_scope { order(title: :desc) }
  scope :level, ->(level) { where(level: level) }
  scope :by_category, ->(title_category) { joins(:category).where(categories: { title: title_category }) }
  scope :easy,    -> { level(0..1) }
  scope :medium,  -> { level(2..4) }
  scope :hard,    -> { level(5..Float::INFINITY) }


  def self.sort_by_category(category_title)
    by_category(category_title)
      .pluck(:title)
  end

  def time_limited?
    time_limit.positive?
  end
end
