class Badge < ApplicationRecord
  has_many :badge_users, dependent: :destroy
  has_many :users, through: :badge_users

  validates :name, presence: true
  validates :picture, presence: true
  validates :control, inclusion: { in: BadgeControlService::RULE_TYPES }
  validates :control_param, uniqueness: { scope: :control }

end
