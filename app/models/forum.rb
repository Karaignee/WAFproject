# == Schema Information
#
# Table name: forums
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Forum < ActiveRecord::Base

  attr_accessible :body, :title, :user_id

  #relationships
  belongs_to :user
  has_many :comments

  #validation

end
