class VotesController < ApplicationController
  before_action :authenticate_user!
  def new
  end

  def create
    if !current_user
      current_user = User.find(params[:user_id])
    end
    @vote = Vote.new(user_id: current_user.id, place_id: params[:place_id])


    respond_to do |format|
      if @vote.save
        format.html {redirect_to "/places/#{params[:place_id]}"}
        format.json {render json: {message: "Vote Successful"}}
      else
        format.html {redirect_to "/places/#{params[:place_id]}"}
        format.json {render json: {errors: @vote.errors.full_messages}, :status => 403}
      end
    end

  end

end
