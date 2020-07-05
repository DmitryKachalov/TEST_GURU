class Question < ApplicationRecord
  # у вопросы пренадлежит одному тесту
  belongs_to :test
  # у вопроса несколько ответов
  has_many :answers, dependent: :destroy
  has_many :gists, dependent: :destroy
  has_many :test_passages, foreign_key: :current_question_id, dependent: :nullify



  validates :body, presence: true
end
