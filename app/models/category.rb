class Category < ApplicationRecord

  has_many :trip_categories
  has_many :itineraries, through: :trip_categories


end
