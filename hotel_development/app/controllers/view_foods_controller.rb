class ViewFoodsController < ApplicationController
  
  def show

    if logged_in? &&  current_user.user_type == '0'

      render 'admins/strict'

    else

    @food_type = FoodTypeService.getFoodTypeByID(params[:id])

    end
    
  end
  
end
