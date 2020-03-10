class Answer < ApplicationRecord
  # у ответов один вопрос
  belongs_to :question

  scope :correct_answer, -> { where(correct: true) }
end
