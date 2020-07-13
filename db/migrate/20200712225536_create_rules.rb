class CreateRules < ActiveRecord::Migration[6.0]
  def change
    create_table :rules do |t|
      t.string :type, null: false, default: 'Rule'
      t.string :description

      t.timestamps
    end

    add_index :rules, :type
  end
end
