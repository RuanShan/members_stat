class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :customer
      t.integer :unit
      t.decimal :price
      t.datetime :buy_at
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
