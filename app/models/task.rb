class Task < ActiveRecord::Base
  attr_accessible :active, :description, :title

  #relationships
  belongs_to :project

  #validation
  validates :user_id, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates :title, presence: true

  #methods

end
