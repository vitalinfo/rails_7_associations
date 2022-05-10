class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.references :user, index: true, foreign_key: true
      t.column :name, :string, null: false
      t.timestamps
    end
  end
end
