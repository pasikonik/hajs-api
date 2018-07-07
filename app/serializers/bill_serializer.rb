class BillSerializer < ActiveModel::Serializer
  attributes :id, :name, :amount, :created_at

  belongs_to :place
  has_many :payments
end
