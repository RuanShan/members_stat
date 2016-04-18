class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :id_num
      t.string :cellphone
      t.integer :status, default: 0
      # accumulated bonus we paid
      t.decimal :payback, default: 0.0
      # accumulated sales.units,
      t.integer :hold_shares, default: 0
      t.timestamps null: false
    end
  end
end
