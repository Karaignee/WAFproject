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
  #validates :body, presence: true
  #validates :title, presence: true
  validates :user_id, presence: true, numericality: {only_integer: true, greater_than: 0}

end
