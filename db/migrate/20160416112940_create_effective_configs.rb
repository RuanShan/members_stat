class CreateEffectiveConfigs < ActiveRecord::Migration
  def change
    create_table :effective_configs do |t|
      t.integer :ename, default: 0
      t.string :effect_value
      t.date :effect_at

      t.timestamps null: false
    end
  end
end
