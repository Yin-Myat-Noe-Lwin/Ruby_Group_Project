class FoodsController < ApplicationController

  before_action :ensure_admin

  def ensure_admin

    if !logged_in? || current_user.user_type == '1'
      #raise ActionController::RoutingError, 'Not Found'
      render 'admins/strict'
      
    end

  end

  def new

    @food = Food.new

  end

  def create

    @food = Food.new(food_params)

    @upload = params[:food][:food_img]

    if (@upload)

      File.open( Rails.root.join('app/assets', 'images/foods', @upload.original_filename), 'wb') do |file|
                
      file.write( @upload.read )

      @food.food_img =  "foods/" + @upload.original_filename
        
      end

    end

    @is_food_create = FoodService.createFood(@food)

    respond_to do |format|

      @errorName      = []

      @errorPrice     = []

      @errorDes        = []

      @errorImg        = []

    if @is_food_create 

      format.js{render :js => "window.location.href='"+foods_path+"'"}

    else

      format.js

      if (@food.errors["name"] != nil)

        @errorName.push(@food.errors["name"][0])
  
      end

      if (@food.errors["price"] != nil)

        @errorPrice.push(@food.errors["price"][0])
  
      end

      if (@food.errors["description"] != nil)

        @errorDes.push(@food.errors["description"][0])
  
      end

      if (@food.errors["food_img"] != nil)

        @errorImg.push(@food.errors["food_img"][0])
  
      end

    end

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
    
    @is_food_update = FoodService.updateFood(@food,  update_room_params )

    respond_to do |format|

      @errorName      = []

      @errorPrice     = []

      @errorDes        = []

    if @is_food_update

      format.js{render :js => "window.location.href='"+foods_path+"'"}

    else

      format.js

      if (@food.errors["name"] != nil)

        @errorName.push(@food.errors["name"][0])
  
      end

      if (@food.errors["price"] != nil)

        @errorPrice.push(@food.errors["price"][0])
  
      end

      if (@food.errors["description"] != nil)

        @errorDes.push(@food.errors["description"][0])
  
      end

    end

  end

end

def destroy
  
  @food = FoodService.getFoodByID(params[:id])

  FoodService.destroyFood(@food)

  respond_to do |format|

    format.js{render :js => "window.location.href='"+foods_path+"'"}
  end
end

  private 

  def food_params

    params.require(:food).permit(:name, :price, :description, :food_type_id, :food_img)
  
  end

  def update_room_params

    @upload = params[:food][:food_img]

    if (@upload)

      File.open( Rails.root.join('app/assets', 'images/foods', @upload.original_filename), 'wb') do |file|
                
      file.write( @upload.read )

     params[:food][:food_img]=  "foods/" + @upload.original_filename
        
      end

    end

    params.require(:food).permit(:name, :price, :description, :food_type_id, :food_img)
  
  end

end
