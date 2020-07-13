class CreateNewRules < ActiveRecord::Migration[6.0]
  def change
    create_table :rules do |t|
      t.string :filter_attribute, null: false
      t.string :filter_value, null: false
      t.string :description

      t.timestamps
    end

    create_table :badges do |t|
      t.string :name
      t.string :picture
      t.belongs_to :rule, foreign_key: true

      t.timestamps
    end

    create_table :user_badges do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :badge, foreign_key: true

      t.timestamps
    end

    add_index :user_badges, [:user_id, :badge_id]
  end
end
