# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  login               :string(255)
#  first_name          :string(255)
#  last_name           :string(255)
#  crypted_password    :string(128)      default(""), not null
#  password_salt       :string(128)      default(""), not null
#  perishable_token    :string(255)
#  single_access_token :string(255)
#  login_count         :integer          default(0)
#  failed_login_count  :integer          default(0)
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string(255)
#  last_login_ip       :string(255)
#  active              :boolean          default(FALSE), not null
#  user_group_id       :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  persistence_token   :string(255)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
