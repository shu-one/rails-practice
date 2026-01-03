class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users, primary_key: :user_id, id: false do |t|
      t.integer :user_id, limit: 8
      t.string :user_name, limit: 32
      t.timestamp :deleted_at

      t.timestamps
    end
    add_index :users, :user_id, unique: true
  end
end
