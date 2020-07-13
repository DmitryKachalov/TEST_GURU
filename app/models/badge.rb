class Badge < ApplicationRecord
  has_many :badge_users, dependent: :destroy
  has_many :users, through: :badge_users

  validates :name, presence: true
  validates :picture, presence: true
  validates :control, presence: true
  validates :control_param, uniqueness: { scope: :control }

end
