class CreateWaiters < ActiveRecord::Migration
  def change
    create_table :waiters do |t|
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
