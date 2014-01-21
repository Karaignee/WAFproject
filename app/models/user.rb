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

class User < ActiveRecord::Base
  attr_accessible :active, :current_login_at, :current_login_ip, :failed_login_count, :first_name, :last_login_at, :last_login_ip, :last_name, :last_request_at, :login, :login_count, :perishable_token, :persistence_token, :single_access_token, :user_group_id, :password, :password_confirmation

  acts_as_authentic do |c|
    if Rails.env.production?
      c.logged_in_timeout = 60.minutes
    else
      c.logged_in_timeout = 120.minutes
    end
  end

  #relationships
  belongs_to :user_group
  has_many :comments
  has_many :forums
  has_one :vol_profile
  has_one :ngo_profile   # if I want to enforce the rule that user can only have one profile I can call these has_one
  has_many :projects
  has_many :pledges

  # validation
  validates :login, presence: true, uniqueness: true,
            format: { with:  /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i, message: 'must be a valid email address.'},
            length: {in: (7..40)}
  validates :first_name, presence: true, length: {in: 2..30}
  validates :last_name, presence: true, length: {in: 2..40}
  validates :user_group_id, presence: true, numericality: {only_integer: true, greater_than: 0} #inclusion: {in: UserGroup.full_list_of_ids, message: 'is not valid'}
  validates :password, length: {minimum: 5}, on: :update, allow_nil: true, allow_blank: true
  validates :password, confirmation: true, if: '!password.nil?'
  validates :password_confirmation, presence: true, on: :create

  #methods
  def full_name
    return first_name.titleize + " " + last_name.gsub("O'", "O' ").titleize.gsub("O' ", "O'")
  end

  def admin?
    self.user_group.is_an_admin
  end

  def charity?
    self.user_group.is_a_charity
  end

  def volunteer?
    self.user_group.is_a_volunteer
  end

  def self.search_request(user_search)
    search_result = []
    records = User.where('first_name LIKE ? or last_name LIKE ?', '%' + user_search + '%', '%' + user_search + '%')

    if records.count > 0
      records.uniq.each do |x|
        search_result << {model_name: 'User', url: '/users/' + x.id.to_s, name: x.full_name, description: x.full_name}
      end
    end
    search_result
  end





end