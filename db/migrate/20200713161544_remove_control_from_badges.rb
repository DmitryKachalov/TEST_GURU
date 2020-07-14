class RemoveControlFromBadges < ActiveRecord::Migration[6.0]
  def change
    remove_column :badges, :control
  end
end
