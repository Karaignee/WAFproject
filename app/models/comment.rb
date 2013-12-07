# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  commenter  :string(255)
#  body       :text
#  forum_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
  belongs_to :forum
  belongs_to :user
  attr_accessible :body, :user_id, :forum_id

  #validation
  validates :body, presence: true

  def self.search_request(comment_search)
    search_result = []
    records = where('body LIKE ?' '%' + comment_search + '%')
    records.each do |x|
      search_result << {model_name: 'Comment', url: '/comments/' + x.comment_id.to_s, name: x.body, description: x.body}

    end
    search_result
  end

end
