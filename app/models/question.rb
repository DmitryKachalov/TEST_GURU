class Question < ApplicationRecord
  # у вопросы пренадлежит одному тесту
  belongs_to :test
end
