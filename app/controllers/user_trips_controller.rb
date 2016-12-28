class UserTripsController < ApplicationController

  def create
    @new = UserTrip.new(user_id: current_user.id, trip_id: params[:trip_id])
    @new.save

    redirect_to "/trips/#{@new.trip_id}"
  end

end
