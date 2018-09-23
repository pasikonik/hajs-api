class PlaceSerializer < ActiveModel::Serializer
  attributes :name, :rent

  has_many :users
  belongs_to :payer
end
