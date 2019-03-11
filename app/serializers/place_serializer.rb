class PlaceSerializer < ActiveModel::Serializer
  attributes :name, :rent

  has_many :users
  has_many :bills
  has_many :payments
end
