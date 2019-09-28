class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.string :name
      t.integer :amount
      t.references :payment, foreign_key: true
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
