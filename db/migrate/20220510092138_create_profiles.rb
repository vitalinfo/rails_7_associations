class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true, index: false
      t.column :name, :string, null: false
      t.timestamps
    end

    add_index :profiles, :user_id, unique: true
  end
end
