class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments do |t|
      t.references :company, foreign_key: true, index: false
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end

    add_index :user_settings, %i[company_id user_id], unique: true
  end
end
