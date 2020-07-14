class AddTimeLimitToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :time_limit, :integer, default: 0
  end
end
