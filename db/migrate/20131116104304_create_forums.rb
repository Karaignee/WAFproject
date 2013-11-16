class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :title
      t.text :body
      t.references :user

      t.timestamps
    end
    add_index :forums, :user_id
  end
end
