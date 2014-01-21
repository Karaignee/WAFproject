# == Schema Information
#
# Table name: pledges
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  task_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Pledge < ActiveRecord::Base

  attr_accessible :title, :body, :task_id

  #relationships
  belongs_to :user
  belongs_to :task

  #validation
  validates :user_id, presence: true


#def self.search_request(pledge_search)
 # search_result = []
  #records = where()
  #records.each do |x|
   # search_result << {model_name: '', url: '/pledges/' + x.user_id.to_s, name: x., description: x.}
  #end
  #search_result
#end
end
