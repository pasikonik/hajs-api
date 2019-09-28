class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :type
      t.string :status
      t.integer :amount
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
