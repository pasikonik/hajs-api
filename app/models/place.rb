class Place < ApplicationRecord
  has_many :users
  has_many :bills
  has_many :payments

  def payer
    users.find_by(payer: true)
  end
end
