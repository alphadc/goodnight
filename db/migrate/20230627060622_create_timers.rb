class CreateTimers < ActiveRecord::Migration[7.0]
  def change
    create_table :timers do |t|
      t.integer :user_id
      t.string :user_status

      t.timestamps
    end
  end
end
