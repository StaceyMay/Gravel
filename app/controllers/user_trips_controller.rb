class UserTripsController < ApplicationController
before_action :authenticate_user!

  def create
    @new = UserTrip.new(user_id: current_user.id, trip_id: params[:trip_id])
    @new.save

    redirect_to "/trips/#{@new.trip_id}"
  end

  def invite
  end

  def add_to_trip
    trip = Trip.find_by(slug: params[:slug])
    if trip && (trip.password == params[:password])
      @new = UserTrip.new(user_id: current_user.id, trip_id: trip.id, admin: false)
      @new.save
      redirect_to "/trips/#{@new.trip_id}"
      # #{@new.trip_id}
    else
      render :invite
    end
  end

end
