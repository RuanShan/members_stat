class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.datetime :free_date
      t.string :deleted_at
      t.string :datetime

      t.timestamps null: false
    end
  end
end
