class Item < ActiveRecord::Base
  belongs_to :list

  validates_presence_of :list
  validates_presence_of :title
  validates_length_of :title, minimum: 5
end
