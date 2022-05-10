class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships do |t|
      t.references :company, foreign_key: true, index: false
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end

    add_index :memberships, %i[company_id user_id], unique: true
  end
end
