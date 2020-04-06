class TestPassage < ApplicationRecord
  # соединительная таблица собирает данные какой юзер прошел определенный тест
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true
end
