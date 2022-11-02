class FoodTypesController < ApplicationController
  before_action :ensure_admin

  def ensure_admin

    if !logged_in? || current_user.user_type == '1'
      #raise ActionController::RoutingError, 'Not Found'
      render 'food_type_strict'
      
    end

  end

  def new

    @food_type = FoodType.new

end

def create

  @food_type = FoodType.new(food_type_params)

  @is_food_type_create = FoodTypeService.createFoodType(@food_type)

  if @is_food_type_create 

    flash.notice="Sign up successful"

    redirect_to dashboard_path

  else

    render 'new'

  end

end

def index
  @food_types = FoodTypeService.getAllFoodTypes
end

def show
  @food_type = FoodTypeService.getFoodTypeByID(params[:id])
end

def edit

  @food_type = FoodTypeService.getFoodTypeByID(params[:id])

end

def update

  @food_type = FoodTypeService.getFoodTypeByID(params[:id])
  
  @is_food_type_update = FoodTypeService.updateFoodType(@food_type, food_type_params )

  if @is_food_type_update

    redirect_to dashboard_path

  else

    flash.notice = "Something wrong"

  end

end

def destroy
  @food_type = FoodTypeService.getFoodTypeByID(params[:id])

  FoodTypeService.destroyFoodType(@food_type)
end

private

def food_type_params

  params.require(:food_type).permit(:name)

end

end
