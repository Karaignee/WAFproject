class CreateNgoProfiles < ActiveRecord::Migration
  def change
    create_table :ngo_profiles do |t|
      t.string :name
      t.text :about
      t.text :details
      t.text :links
      t.references :user

      t.timestamps
    end
    add_index :ngo_profiles, :user_id
  end
end
