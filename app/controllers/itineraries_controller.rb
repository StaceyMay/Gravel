class ItinerariesController < ApplicationController

  def new
  end

  def create
    @itinerary = Itinerary.new(trip_id: params[:id], public: params[:public])
    @itinerary.save
    @new = Itinerary_place.new(place_id: current_user.id, when: params[:when] itinerary_id: @itinerary.id)
    @new.save
  end
end
