class AddPlaceRefToPayments < ActiveRecord::Migration[5.2]
  def change
    add_reference :payments, :place, foreign_key: true
  end
end
