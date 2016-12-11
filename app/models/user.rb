class User < ApplicationRecord
  
  has_many :user_trips
  has_many :trips, through: :user_trips
  has_many :expenses
  has_many :place_comments
  has_many :trip_comments


end
