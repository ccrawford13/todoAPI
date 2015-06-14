class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :user_name, :email, :creation_date

  def full_name
    object.full_name
  end
end
