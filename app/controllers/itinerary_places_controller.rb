class ItineraryPlacesController < ApplicationController
  before_action :authenticate_user!
  
  def new
  end

  def create
    params[:itinerary_places].each do |ip|
      @new_place = ItineraryPlace.new(itinerary_id: params[:itinerary_id], place_id: ip)
      @new_place.save
    end

    redirect_to "/itinerary/#{@new_place.itinerary_id}/edit"
  end

  def destroy
    @itinerary_place = ItineraryPlace.find_by(id: params[:itinerary_place_id])
    @itinerary_place.destroy

    redirect_to "/itinerary/#{@itinerary_place.itinerary_id}"
  end
end
