class DropRules < ActiveRecord::Migration[6.0]
  def change
    drop_table :rules
  end
end
