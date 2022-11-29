class FoodTypesController < ApplicationController

  before_action :ensure_admin

  def ensure_admin

    if !logged_in? || current_user.user_type == '1'

      render 'admins/strict'
      
    end

  end

  def new

    @food_type = FoodType.new

  end

  def create

    @food_type = FoodType.new(food_type_params)

    @upload = params[:food_type][:food_type_img]

    if (@upload)

      File.open( Rails.root.join('app/assets', 'images/food_types', @upload.original_filename), 'wb') do |file|
              
      file.write( @upload.read )

      @food_type.food_type_img =  "food_types/" + @upload.original_filename
      
      end

    end

    @is_food_type_create = FoodTypeService.createFoodType(@food_type)

    respond_to do |format|

      @errorName      = []

      @errorImg       = []

      if @is_food_type_create 

        format.js{render :js => "window.location.href='"+food_types_path+"'"}  

      else

        format.js

        @food_type.errors.any?

        if (@food_type.errors["name"] != nil)

          @errorName.push(@food_type.errors["name"][0])

        end

        if (@food_type.errors["food_type_img"] != nil)

          @errorImg.push(@food_type.errors["food_type_img"][0])

        end

      end

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
  
    @is_food_type_update = FoodTypeService.updateFoodType(@food_type, update_food_type_params)

    respond_to do |format|

      @errorName      = []
  
      if @is_food_type_update

        format.js{render :js => "window.location.href='"+food_types_path+"'"}  

      else

        format.js

        if (@food_type.errors["name"] != nil)

          @errorName.push(@food_type.errors["name"][0])

        end

      end

    end

  end

  def destroy

    @food_type = FoodTypeService.getFoodTypeByID(params[:id])

    FoodTypeService.destroyFoodType(@food_type)

    respond_to do |format|

      format.js{render :js => "window.location.href='"+food_types_path+"'"}  

    end

  end

  private

  def food_type_params

    params.require(:food_type).permit(:name , :food_type_img)

  end

  def update_food_type_params

    @upload = params[:food_type][:food_type_img]

    if (@upload)

      File.open( Rails.root.join('app/assets', 'images/food_types', @upload.original_filename), 'wb') do |file|
              
      file.write( @upload.read )

      params[:food_type][:food_type_img]=  "food_types/" + @upload.original_filename
      
      end

    end

    params.require(:food_type).permit(:name, :food_type_img)

  end

end