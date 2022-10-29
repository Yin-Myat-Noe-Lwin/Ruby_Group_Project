class FoodType < ApplicationRecord

  has_many :foods, dependent: :destroy
  
end
