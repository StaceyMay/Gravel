class CreateItineraries < ActiveRecord::Migration[5.0]
  def change
    create_table :itineraries do |t|
      t.integer :trip_id
      t.boolean :public

      t.timestamps
    end
  end
end
