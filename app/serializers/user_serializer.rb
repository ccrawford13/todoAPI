class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :user_name, :email, :created_at

  def full_name
    object.full_name
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end

end
