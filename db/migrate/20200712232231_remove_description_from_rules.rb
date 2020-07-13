class RemoveDescriptionFromRules < ActiveRecord::Migration[6.0]
  def change
    remove_column :rules, :description
  end
end
