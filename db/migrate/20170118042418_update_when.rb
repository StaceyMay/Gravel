class UpdateWhen < ActiveRecord::Migration[5.0]
  def change
    change_column :itinerary_places, :when, :datetime
  end
end
