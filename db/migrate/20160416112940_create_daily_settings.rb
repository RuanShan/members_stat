class CreateDailySettings < ActiveRecord::Migration
  def change
    create_table :daily_settings do |t|
      t.integer :ename, default: 0
      t.string :effect_value
      t.date :effect_at

      t.timestamps null: false
    end
  end
end
