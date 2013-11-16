class User < ActiveRecord::Base
  attr_accessible :active, :crypted_password, :current_login_at, :current_login_ip, :failed_login_count, :first_name, :last_login_at, :last_login_ip, :last_name, :last_request_at, :login, :login_count, :password_salt, :perishable_token, :persistence_token, :single_access_token, :user_group_id

  acts_as_authentic do |c|
    if Rails.env.production?
      c.logged_in_timeout = 60.minutes
    else
      c.logged_in_timeout = 120.minutes
    end
  end

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

  def full_name
    return first_name.titleize + " " + last.name.gsub("O\'", "O\'").titleize.gsub("O\'", "O\'")
  end

end
