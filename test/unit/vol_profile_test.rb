# == Schema Information
#
# Table name: vol_profiles
#
#  id         :integer          not null, primary key
#  about      :text
#  details    :text
#  skills     :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class VolProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
