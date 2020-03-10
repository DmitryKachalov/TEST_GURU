class Question < ApplicationRecord
  # у вопросы пренадлежит одному тесту
  belongs_to :test
  # у вопроса несколько ответов
  has_many :answers, dependent: :destroy

  validates :body, presence: true
end
