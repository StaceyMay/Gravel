class ItineraryPlacesController < ApplicationController
  def new
  end

  def create
    params[:itinerary_places].each do |ip|
      @new_place = ItineraryPlace.new(itinerary_id: params[:itinerary_id], place_id: ip)
      @new_place.save
    end

    redirect_to "/itinerary/#{@new_place.itinerary_id}"
  end

end
