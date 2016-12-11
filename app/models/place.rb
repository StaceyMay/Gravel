class Place < ApplicationRecord

  belongs_to :trip
  has_many :place_comments
  
end
