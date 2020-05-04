class Place < ApplicationRecord

  geocoded_by :address, :latitude => :latitude, :longitude => :longitude
  after_validation :geocode
  

  belongs_to :trip
  has_many :place_comments
  has_many :votes
  has_many :expenses


end
