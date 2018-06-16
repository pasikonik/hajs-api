class AddBanToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :encrypted_ban, :string
    add_column :users, :encrypted_ban_iv, :string
  end
end
