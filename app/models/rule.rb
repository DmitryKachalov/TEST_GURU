class Rule < ApplicationRecord
  has_one :badge

  def set_filter_value(filter_value); end

  def meets?
    false
  end
end
