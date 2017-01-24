class TripCategory < ApplicationRecord

  belongs_to :itinerary
  belongs_to :category

  validates_uniqueness_of :category_id, scope: :itinerary_id
end
