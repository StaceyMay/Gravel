class ExpensesController < ApplicationController
  # before_action :authenticate_user!

  def new
  end

  def create
    @expense = Expense.new(user_id: current_user.id, place_id: params[:id],amount: params[:amount], description: params[:description])
    @expense.save

    redirect_to "/places/#{@expense.place_id}"
  end
  
end
