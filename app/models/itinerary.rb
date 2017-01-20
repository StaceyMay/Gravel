class Itinerary < ApplicationRecord
  belongs_to :trip
  has_many :itinerary_places
  has_many :trip_categories
  has_many :itineraries, through: :trip_categories
end
