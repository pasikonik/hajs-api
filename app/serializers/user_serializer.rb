class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :ban, :max_pay

  belongs_to :place
  has_many :payments
end
