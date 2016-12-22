class Place < ApplicationRecord

  geocoded_by :address 
  after_validation :geocode
  

  belongs_to :trip
  has_many :place_comments

end
