class AddFoodTypeToFoods < ActiveRecord::Migration[7.0]
  def change
    add_reference :foods, :food_type, index: true
    add_foreign_key :foods, :food_types
  end
end
