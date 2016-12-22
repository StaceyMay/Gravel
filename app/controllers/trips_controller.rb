class TripsController < ApplicationController

  def index
    @trips = Trip.all


    @trips = current_user.trips.all
  end

  def show
    @trip = Trip.find_by(id: params[:id])
  end

  def new
  end

  def create
      @trip = Trip.new(name: params[:name])
      @trip.save
      redirect_to "/trips/#{@trip.id}"
  end

  def destroy
    @trip = Trip.find_by(id: params[:id])
    @trip.destroy

    redirect_to "/trips"
  end
  
end
