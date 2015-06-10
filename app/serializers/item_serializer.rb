class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :list_id, :created_at, :completed

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end

end
