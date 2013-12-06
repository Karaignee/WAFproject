class NgoProfile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :about, :details, :links, :name
end
