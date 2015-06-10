class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lists

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :user_name
  validates_presence_of :email
  validates_presence_of :password
  validates_presence_of :password_confirmation

  def full_name
    [first_name, last_name].join(" ").titleize
  end
  
end
