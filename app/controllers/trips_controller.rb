class TripsController < ApplicationController
before_action :authenticate_user!

  def index
    # @trips = Trip.all


    @trips = current_user.trips.all
  end

  def show
    @trip = Trip.find_by(id: params[:id])


    @locs = []
    count = 0
    @location = @trip.places.all.each do |place|
                loc = []
                count += 1
                loc << place.name
                loc << place.latitude
                loc << place.longitude
                loc << count
                @locs << loc
                end
  end

  def new
  end

  def create
      @trip = Trip.new(name: params[:name])
      @trip.save
      # redirect_to "/trips/#{@trip.id}"
  end

  def destroy
    @trip = Trip.find_by(id: params[:id])
    @trip.destroy

    redirect_to "/trips"
  end

  
end
