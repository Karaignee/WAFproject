class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    t.string :login
    t.string :first_name
    t.string :last_name
    t.string :crypted_password, :limit => 128, :default => "", :null => false
    t.string :password_salt, :limit => 128, :default => "", :null => false
    t.string :perishable_token, :limit => 128
    t.string :perishable_token
    t.string :single_access_token
    t.integer :login_count, :default => 0
    t.integer :failed_login_count, :default => 0
    t.datetime :last_request_at
    t.datetime :current_login_at
    t.datetime :last_login_at
    t.string :current_login_ip
    t.string :last_login_ip
    t.boolean :active, :default => false, :null => false
    t.integer :user_group_id

      t.timestamps
    end
  end
end

