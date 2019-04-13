# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :place
  belongs_to :bill, optional: true
end
