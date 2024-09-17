class FoodService

  class << self

    def getAllFoods

      @foods = FoodRepository.getAllFoods

    end

    def createFood(food)

     @is_food_create = FoodRepository.createFood(food)

    end

    def getFoodByID(id)

      @food = FoodRepository.getFoodByID(id)

    end

    def updateFood(food, food_params)

      @is_food_update = FoodRepository.updateFood(food, food_params)

    end

    def destroyFood(food)

      FoodRepository.destroyFood(food)

    end

  end

end