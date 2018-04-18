class TripCommentsController < ApplicationController
  # before_action :authenticate_user!

  def new
  end

  def create
    @comment = TripComment.new(trip_id: params[:id], comment: params[:comment], user_id: current_user.id)
    @comment.save

    redirect_to "/trips/#{@comment.trip_id}"
  end
end
