class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :place
  belongs_to :bill, required: false
end
