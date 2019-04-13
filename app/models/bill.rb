# frozen_string_literal: true

class Bill < ApplicationRecord
  belongs_to :place
  has_many :payments, dependent: :destroy
  has_many :users, through: :place
end
