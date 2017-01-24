class CategoriesController < ApplicationController

  def new
  end

  def create

    @category = Category.new(category: params[:category].downcase)
    @category.save

    @cat = TripCategory.new(category_id: @category.id, itinerary_id: params[:itinerary_id])
      if 
      @cat.save
      else
      flash[:danger] =  "You cannot enter category twice."
      end
    
    redirect_to "/itinerary/#{@cat.itinerary_id}"
  end
end
