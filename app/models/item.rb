class Item < ActiveRecord::Base
  belongs_to :list

  validates_presence_of :list
  validates_presence_of :title
  validates_length_of :title, minimum: 5

  def toggle_completed
    if self.completed == false
      self.update_attributes(completed: true)
    else
      self.update_attributes(completed: false)
    end
  end
end
