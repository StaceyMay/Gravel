class ItineraryPlace < ApplicationRecord
  belongs_to :itinerary 
  belongs_to :place

  validates_uniqueness_of :place_id, scope: :itinerary_id
end
