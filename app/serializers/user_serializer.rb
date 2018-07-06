class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username

  belongs_to :place
end
