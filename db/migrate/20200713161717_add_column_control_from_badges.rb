class AddColumnControlFromBadges < ActiveRecord::Migration[6.0]
  def change
    add_column :badges, :control, :string
  end
end
