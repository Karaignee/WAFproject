# == Schema Information
#
# Table name: user_groups
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  description    :text
#  is_an_admin    :boolean
#  is_a_charity   :boolean
#  is_a_volunteer :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class UserGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
