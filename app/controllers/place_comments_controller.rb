class PlaceCommentsController < ApplicationController

  def new
  end

  def create
    @comment = PlaceComment.new(place_id: params[:id], comment: params[:comment], user_id: current_user.id)
    @comment.save

    redirect_to "/places/#{@comment.place_id}"
  end

  
end
