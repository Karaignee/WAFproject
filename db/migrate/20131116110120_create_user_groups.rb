class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.string :name
      t.text :description
      t.boolean :is_an_admin
      t.boolean :is_a_charity
      t.boolean :is_a_volunteer

      t.timestamps
    end
  end
end
