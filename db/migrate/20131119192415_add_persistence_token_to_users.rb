class AddPersistenceTokenToUsers < ActiveRecord::Migration
  def change
     add_column :users, :persistence_token, :string
    #I forgot it in user table the first time around
  end
end
