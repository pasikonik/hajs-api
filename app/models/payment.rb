class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :bill, required: false
  belongs_to :place
end
