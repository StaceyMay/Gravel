class UpdateTripCatTable < ActiveRecord::Migration[5.0]
  def change
    rename_column :trip_categories, :trip_id, :itinerary_id

  end
end
