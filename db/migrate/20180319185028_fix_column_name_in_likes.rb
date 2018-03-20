class FixColumnNameInLikes < ActiveRecord::Migration[5.1]
  def change
  	rename_column :likes, :sightings_id, :sighting_id
  end
end
