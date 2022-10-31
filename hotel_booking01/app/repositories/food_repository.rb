class FoodRepository
  
  class << self
    
    def getAllFoods

      @foods = Food.all

    end

    def createFood(food)

      @is_food_create = food.save

    end

    def getFoodByID(id)

      @food = Food.find(id)

    end

    def updateFood(food, food_params)

      @is_update_food = food.update(food_params)

    end

    def destroyFood(food)

      food.destroy

    end

  end

end