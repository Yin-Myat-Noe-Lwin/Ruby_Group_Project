class FoodTypeService

  class << self

    def getAllFoodTypes

      @food_types = FoodTypeRepository.getAllFoodTypes

    end

    def createFoodType(food_type)

     @is_food_type_create = FoodTypeRepository.createFoodType(food_type)

    end

    def getFoodTypeByID(id)

      @food_type = FoodTypeRepository.getFoodTypeByID(id)

    end

    def updateFoodType(food_type, food_type_params)

      @is_food_type_update = FoodTypeRepository.updateFoodType(food_type, food_type_params)

    end

    def destroyFoodType(food_type)

      FoodTypeRepository.destroyFoodType(food_type)

    end

  end

end