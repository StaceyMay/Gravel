class Trip < ApplicationRecord

  has_many :user_trips
  has_many :users, through: :user_trips
  has_many :places
  has_many :trip_comments
  has_many :trip_categories
  has_many :categories, through: :trip_categories
  has_one :itinerary 

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  after_create :remake_slug

  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [:name, [:name, :id_for_slug]]
  end

  def id_for_slug
    generated_slug = normalize_friendly_id(name)
    things = self.class.where('slug ~* :pattern', pattern: "#{generated_slug}(-[0-9]+)?$")
    things = things.where.not(id: id) unless new_record?
    things.count + 1
  end

  def remake_slug
    self.update_attribute(:slug, nil)
    self.save!
  end

  #You don't necessarily need this bit, but I have it in there anyways
  def should_generate_new_friendly_id?
    new_record? || self.slug.nil?
  end

  def admins
    User.where(id: user_trips.where(admin: true).pluck(:user_id))
  end

  def currently_admin
    return admins.pluck(:id)
  end

end
