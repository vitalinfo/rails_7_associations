class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.references :user, index: true, foreign_key: true
      t.column :message, :string, null: false
      t.timestamps
    end
  end
end
