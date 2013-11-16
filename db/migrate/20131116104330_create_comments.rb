class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :forum
      t.references :user

      t.timestamps
    end
    add_index :comments, :forum_id
    add_index :comments, :user_id
  end
end
