class TripsController < ApplicationController
before_action :authenticate_user!, except: [:home]


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
      @trip = Trip.new(name: params[:name], password: SecureRandom.hex(3))
      @trip.save
      @new = UserTrip.new(user_id: current_user.id, trip_id: @trip.id, admin: true)
      @new.save
      redirect_to "/trips/#{@trip.id}"
      # redirect_to "/trips/#{@trip.id}"
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update
    trip = Trip.find_by(id: params[:id])
    trip.assign_attributes(name: params[:name], password: params[:password])
    trip.save

    flash[:info] =  "You have updated your trip!"

    redirect_to "/trips/#{trip.id}"
  end

  def destroy
    @trip = Trip.find_by(id: params[:id])
    @trip.destroy

    redirect_to "/trips"
  end

  # def send_trip_mail
  # @trip = Trip.find(params[:id])


  # TripmailerMailer.trip_send(@trip).deliver
  # flash[:notice] = "Invite has been sent."
  # redirect_to "/trips/#{@trip.id}"
  # end


  
end
