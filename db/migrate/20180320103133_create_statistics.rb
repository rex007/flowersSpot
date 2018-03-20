class CreateStatistics < ActiveRecord::Migration[5.1]
  def change
    create_table :statistics do |t|
      t.string :record_type
      t.integer :record_id

      t.timestamps
    end
  end
end
