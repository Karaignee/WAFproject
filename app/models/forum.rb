class Forum < ActiveRecord::Base

  attr_accessible :body, :title

  #relationships
  belongs_to :user
  has_many :comments
end
