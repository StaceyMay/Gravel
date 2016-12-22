class TripCommentsController < ApplicationController

  def new
  end

  def create
    @comment = TripComment.new(trip_id: params[:id], comment: params[:comment], user_id: 1)
    @comment.save

    redirect_to "/trips/#{@comment.trip_id}"
  end
end
