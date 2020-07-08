class Feedback
  include ActiveModel::Model

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :message, presence: true

  attr_accessor :email, :message
end
