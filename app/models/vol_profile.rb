# == Schema Information
#
# Table name: vol_profiles
#
#  id         :integer          not null, primary key
#  about      :text
#  details    :text
#  skills     :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class VolProfile < ActiveRecord::Base
  attr_accessible :about, :details, :skills, :user_id

  #validation
  validates :user_id, presence: true, uniqueness: true #now the system will not allow an ngo to have two profiles and ensure it has a user_it

  #relationships
  belongs_to :user


end
