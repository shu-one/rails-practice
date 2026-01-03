class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users, id: false do |t|
      t.integer :user_id, limit: 8, primary_key: true
      t.string :user_name, limit: 32
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
