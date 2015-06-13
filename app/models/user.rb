class User < ActiveRecord::Base
  has_many :lists

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :user_name
  validates_uniqueness_of :user_name

  def full_name
    [first_name, last_name].join(" ").titleize
  end

end
