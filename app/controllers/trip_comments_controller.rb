class TripCommentsController < ApplicationController

  def new
  end

  def create
    @comment = TripComment.new(trip_id: params[:id], comment: params[:comment], user_id: current_user.id)
    @comment.save

    redirect_to "/trips/#{@comment.trip_id}"
  end
end
