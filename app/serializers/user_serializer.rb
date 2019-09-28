# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :ban, :max_pay, :payer

  belongs_to :place
  has_many :payments
end
