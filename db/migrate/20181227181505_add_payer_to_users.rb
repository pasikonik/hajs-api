class AddPayerToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :payer, :boolean
  end
end
