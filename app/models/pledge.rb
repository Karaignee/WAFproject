class Pledge < ActiveRecord::Base

  attr_accessible :title, :body

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
