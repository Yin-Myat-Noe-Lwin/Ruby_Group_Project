class FoodsController < ApplicationController

  before_action :ensure_admin

  def ensure_admin

    if !logged_in? || current_user.user_type == '1'
      #raise ActionController::RoutingError, 'Not Found'
      render 'food_strict'
      
    end

  end

  def new

    @food = Food.new

  end

  def create

    @food = Food.new(food_params)

    @is_food_create = FoodService.createFood(@food)

    if @is_food_create 

      flash.notice="Sign up successful"

      redirect_to dashboard_path

    else

      render 'new'

    end

  end

  def index
    @foods = FoodService.getAllFoods
  end

  def show
    @food = FoodService.getFoodByID(params[:id])
  end

  def edit

    @food = FoodService.getFoodByID(params[:id])

  end

  def update

    @food = FoodService.getFoodByID(params[:id])
    
    @is_food_update = FoodService.updateFood(@food, food_params )

    if @is_food_update

      redirect_to dashboard_path

    else

      flash.notice = "Something wrong"

    end

end

def destroy
  @food = FoodService.getFoodByID(params[:id])

  FoodService.destroyFood(@food)
end

  private 

  def food_params

    params.require(:food).permit(:name, :price, :description, :food_type_id)
  
  end

end
