class VolProfile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :about, :details, :skills
end
