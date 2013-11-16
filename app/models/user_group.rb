class UserGroup < ActiveRecord::Base
  attr_accessible :description, :is_a_charity, :is_a_volunteer, :is_an_admin, :name

  #relationships
  has_many :users

end
