class CreateVolProfiles < ActiveRecord::Migration
  def change
    create_table :vol_profiles do |t|
      t.text :about
      t.text :details
      t.text :skills
      t.references :user

      t.timestamps
    end
    add_index :vol_profiles, :user_id
  end
end
