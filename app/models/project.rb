class Project < ActiveRecord::Base

  attr_accessible :active, :summary, :title


  #relationships
  belongs_to :user

  #validation
  validates :user_id, presence: true
  validates :title, presence: true


  #methods
  def self.search_request(project_search)
    search_result = []
    records = where('title LIKE ? OR summary LIKE ?','%' + project_search + '%', '%' + project_search + '%')
    records.each do |x|
      search_result << {model_name: 'Project', url: '/projects/' + x.id.to_s, name: x.title, description: x.summary}
    end
    search_result
  end

end

