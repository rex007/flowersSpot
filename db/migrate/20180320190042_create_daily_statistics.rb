class CreateDailyStatistics < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_statistics do |t|
      t.integer :new_flowers
      t.integer :new_sightings
      t.integer :total_flowers

      t.timestamps
    end
  end
end
