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

require 'test_helper'

class NgoProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
