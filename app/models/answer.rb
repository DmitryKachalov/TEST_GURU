class Answer < ApplicationRecord
  # у ответов один вопрос
  belongs_to :question
end
