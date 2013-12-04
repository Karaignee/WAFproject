# == Schema Information
#
# Table name: user_groups
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  description    :text
#  is_an_admin    :boolean
#  is_a_charity   :boolean
#  is_a_volunteer :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class UserGroup < ActiveRecord::Base
  attr_accessible :description, :is_a_charity, :is_a_volunteer, :is_an_admin, :name

  #relationships
  has_many :users

end
