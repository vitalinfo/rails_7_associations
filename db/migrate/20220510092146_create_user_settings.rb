class CreateUserSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :user_settings do |t|
      t.references :user, foreign_key: true, index: false
      t.column :dnd, :boolean, default: false, null: false
      t.timestamps
    end

    add_index :user_settings, :user_id, unique: true
  end
end
