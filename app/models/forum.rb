class Forum < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :title

  #relationships
  has_many :users
end
