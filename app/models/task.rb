# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  active      :boolean
#  project_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Task < ActiveRecord::Base
  attr_accessible :active, :description, :title, :project_id, :task_id

  #relationships
  belongs_to :project
  belongs_to :user
  has_many :pledges

  #validation
  validates :project_id, presence: true
  validates :title, presence: true

  #methods

end
