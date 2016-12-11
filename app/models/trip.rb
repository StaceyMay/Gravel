class Trip < ApplicationRecord

  has_many :user_trips
  has_many :users, through: :user_trips
  has_many :places
  has_many :trip_comments
  has_many :trip_categories
  has_many :categories, through: :trip_categories

end
