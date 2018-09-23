class AddPayerIdToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :payer_id, :integer
  end
end
