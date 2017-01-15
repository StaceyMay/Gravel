class CreateItineraryPlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :itinerary_places do |t|
      t.integer :place_id
      t.date :when
      t.integer :itinerary_id

      t.timestamps
    end
  end
end
