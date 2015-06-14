require 'bcrypt'

class User < ActiveRecord::Base
  has_secure_password
  has_many :lists, dependent: :destroy

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :user_name
  validates_uniqueness_of :user_name
  validates_presence_of :password
  validates_length_of :password, minimum: 8, on: :create
  validates_presence_of :password_confirmation

  def full_name
    [first_name, last_name].join(" ").titleize
  end

  def creation_date
    created_at.strftime('%B %d, %Y')
  end

end
