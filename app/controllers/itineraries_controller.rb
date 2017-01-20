class ItinerariesController < ApplicationController

  def new
  end

  def create
  end

  def show
    @itinerary = Itinerary.find_by(id: params[:itinerary_id])
    @itinerary_places = @itinerary.itinerary_places
  end

  def edit 
    @ips = ItineraryPlace.where(itinerary_id: params[:itinerary_id])
  end

  def update
    @ips = ItineraryPlace.where(itinerary_id: params[:itinerary_id])
    @ips.each do |ip|
      date_info = params["when"][ip.id.to_s]
      date = DateTime.new(date_info[0]["(1i)"].to_i,  
        date_info[0]["(2i)"].to_i,
        date_info[0]["(3i)"].to_i,
        date_info[0]["(4i)"].to_i,
        date_info[0]["(5i)"].to_i)
      ip.assign_attributes(when: date)
      ip.save
    end
    flash[:info] =  "You have updated your itinerary!"

    redirect_to "/itinerary/#{params[:itinerary_id]}"
  end 

end