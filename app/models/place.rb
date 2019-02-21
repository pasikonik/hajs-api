class Place < ApplicationRecord
  has_many :users
  has_many :payments
  has_many :bills

  def payer
    users.find_by(payer: true)
  end
end
