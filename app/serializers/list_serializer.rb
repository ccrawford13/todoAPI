class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id, :created_at, :num_items

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end

  def num_items
    object.items.count
  end

end
