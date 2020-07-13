class Badge < ApplicationRecord
  belongs_to :rule
  has_many :user_badges
  has_many :users, through: :user_badges

  validates :name, presence: true
  validates :picture, presence: true
  validates :rule, presence: true

  scope :with_rule, ->(rule) { where(rule: rule)}

  def self.build(params)
    rule = create_rule(params[:type], params[:filter_value])
    Badge.new(rule: rule, name: params[:name], picture: params[:picture])
  end

  private

  def self.create_rule(type, filter_value)
    rule = type.constantize.new
    rule.set_filter_value(filter_value)
    rule
  end
end
