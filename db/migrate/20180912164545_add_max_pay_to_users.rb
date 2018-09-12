class AddMaxPayToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :max_pay, :integer
  end
end
