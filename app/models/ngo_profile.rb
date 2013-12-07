# == Schema Information
#
# Table name: ngo_profiles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  about      :text
#  details    :text
#  links      :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class NgoProfile < ActiveRecord::Base

  attr_accessible :about, :details, :links, :name, :user_id    #list of attributes accessible by mass assignment

  #validation
  validates :user_id, presence: true, uniqueness: true #now the system will not allow an ngo to have two profiles and ensure it has a user_it

  #relationships
  belongs_to :user

  #methods
  def self.search_request(ngo_profile_search)
    search_result = []
    records = where('about LIKE ? or details LIKE ? or links LIKE ? or name LIKE ?', '%' + ngo_profile_search + '%', '%' + ngo_profile_search + '%', '%' + ngo_profile_search + '%', '%' + ngo_profile_search + '%')
    records.each do |x|
      search_result << {model_name: 'NgoProfile', url: '/users/' + x.user_id.to_s, name: x.name, description: x.details}

    end
    search_result
  end



  end
