# frozen_string_literal: true

class Place < ApplicationRecord
  has_many :users
  has_many :bills, dependent: :destroy
  has_many :payments, dependent: :destroy

  def payer
    users.find_by(payer: true)
  end
end
