# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  summary    :string(255)
#  active     :boolean
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Project < ActiveRecord::Base

  attr_accessible :active, :summary, :title, :user_id


  #relationships
  belongs_to :user
  has_many :tasks

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

