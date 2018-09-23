class User < ApplicationRecord
  has_secure_password
  attr_encrypted :ban, key: Rails.application.secrets.encrypted_key

  has_many :payments
  belongs_to :place, optional: true
end
