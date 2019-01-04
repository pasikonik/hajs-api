class User < ApplicationRecord
  has_secure_password
  attr_encrypted :ban, key: Rails.application.secrets.encrypted_key

  belongs_to :place, optional: true
  has_many :payments
end
