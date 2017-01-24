class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  
  has_many :user_trips
  has_many :trips, through: :user_trips
  has_many :expenses
  has_many :place_comments
  has_many :trip_comments
  has_many :votes

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end


  def currently_admin?(trip)
    if trip
      if UserTrip.find_by(user_id: self.id, trip_id: trip.id, admin: true) != nil
        return true
      else
        return false
      end
    end
    return false
  end

  def first_name
    if name.split.count > 1
      name.split[0..-2].join(' ')
    else
      name
    end
  end

  def last_name
    if name.split.count > 1
      name.split.last
    end
  end

 def group_member?(trip)
  if trip
      if UserTrip.find_by(user_id: self.id, trip_id: trip.id) != nil
        return true
      else
        return false
      end
    end
    return false
  end

end

