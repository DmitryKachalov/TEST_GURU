class TestPassage < ApplicationRecord
  # соединительная таблица собирает данные какой юзер прошел определенный тест
  belongs_to :test
  belongs_to :user
end
