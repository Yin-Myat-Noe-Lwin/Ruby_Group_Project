class FoodTypeRepository
  
  class << self
    
    def getAllFoodTypes

      @food_types = FoodType.all

    end

    def createFoodType(food_type)

      @is_food_type_create = food_type.save

    end

    def getFoodTypeByID(id)

      @food_type = FoodType.find(id)

    end

    def updateFoodType(food_type, food_type_params)

      @is_update_food_type = food_type.update(food_type_params)

    end

    def destroyFoodType(food_type)

      food_type.destroy

    end

  end

end