class Place < ApplicationRecord
  has_many :users
  has_many :payments
end
