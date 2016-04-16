class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :customer
      t.integer :unit
      t.decimal :price
      t.datetime :bonus_started_at
      t.datetime :kickout_at

      t.timestamps null: false
    end
  end
end
