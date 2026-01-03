class CreateCredentials < ActiveRecord::Migration[8.1]
  def change
    create_table :credentials, primary_key: :user_id, id: false do |t|
      t.references :user, foreign_key: { to_table: :users, primary_key: :user_id }
      t.string :login_id, limit: 64
      t.string :password, limit: 256
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
