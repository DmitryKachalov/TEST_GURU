class UserBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge
  has_many :user_badges
  has_many :users, through: :user_badges
end
