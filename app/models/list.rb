class List < ActiveRecord::Base
  belongs_to :user
  has_many :items

  validates_presence_of :user
  validates_presence_of :title
  validates_length_of :title, minimum: 5

end
