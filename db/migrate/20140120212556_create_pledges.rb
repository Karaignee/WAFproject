class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.references :user
      t.references :task

      t.timestamps
    end
    add_index :pledges, :user_id
    add_index :pledges, :task_id
  end
end
