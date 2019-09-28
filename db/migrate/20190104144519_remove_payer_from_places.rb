class RemovePayerFromPlaces < ActiveRecord::Migration[5.2]
  def change
    remove_column :places, :payer_id
  end
end
