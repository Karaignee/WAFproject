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

  attr_accessible :body, :title, :user_id, :tag_list
  acts_as_taggable

  #relationships
  belongs_to :user
  has_many :comments

  #validation
  #validates :body, presence: true
  #validates :title, presence: true
  validates :user_id, presence: true, numericality: {only_integer: true, greater_than: 0}

  #methods
  def self.search_request(forum_search)
    search_result = []
    records = where('title LIKE ? OR body LIKE ?','%' + forum_search + '%', '%' + forum_search + '%')
    records.each do |x|
      search_result << {model_name: 'Forum', url: '/forums/' + x.id.to_s, name: x.body, description: x.body}
    end
    search_result
  end
end
