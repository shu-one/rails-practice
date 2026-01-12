class CreateTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :tasks, id: false do |t|
      t.integer :task_id, limit: 8, primary_key: true
      t.string :task_name, limit: 100
      t.references :user, foreign_key: { to_table: :users, primary_key: :user_id }
      t.timestamp :end_time
      t.string :description, limit: 1000
      t.string :task_status_id, limit: 32
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
