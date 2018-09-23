class Place < ApplicationRecord
  has_many :users
  has_many :payments
  belongs_to :payer, class_name: 'User', foreign_key: 'payer_id', required: true
end
