class PlacesController < ApplicationController
before_action :authenticate_user!

  # def new
  #   if params[:search].present?
  #     @places = Place.near(params[:search])
  #   else
  #     @places = Place.all
  #   end
  # end

  # def create
  #   @place = Place.new(address: params[:search])
  #   @place.save
  # end

  def index
    @places = Place.order('created_at DESC')
  end


  def show
    @place = Place.find_by(id: params[:id])
  end

  def new
    # @place = Place.new
  end

  def create
    @place = Place.new(address: params[:search],phone: params[:phone], name: params[:name], trip_id: params[:trip_id] , latitude: params[:latitude], longitude: params[:longitude])
    @place.save

    redirect_to "/trips/#{@place.trip_id}"

    # if @place.save
    #   flash[:success] = "Place added!"
    #   redirect_to root_path
    # else
    #   render 'new'
    # end
  end

  def edit
    @place = Place.find_by(id: params[:id])
  end

  def update
    place = Place.find_by(id: params[:id])
    place.assign_attributes(address: params[:search],phone: params[:phone], name: params[:name], trip_id: params[:trip_id] , latitude: 0, longitude: 0)
    place.save

    flash[:info] =  "You have updated your place!"

    redirect_to "/places/#{place.id}"
  end

  def destroy
    @place = Place.find_by(id: params[:id])
    @place.destroy

    redirect_to "/trips/#{@place.trip_id}"
  end

  def itinerary
    @itinerary = []
  end
end