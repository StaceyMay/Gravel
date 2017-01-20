class CategoriesController < ApplicationController

  def new
  end

  def create
    @category = Category.new(category: params[:category])
    @category.save
    @cat = TripCategory.new(category_id: @category.id, itinerary_id: params[:itinerary_id])
    @cat.save

    redirect_to "/itinerary/#{@cat.itinerary_id}"
  end
end
