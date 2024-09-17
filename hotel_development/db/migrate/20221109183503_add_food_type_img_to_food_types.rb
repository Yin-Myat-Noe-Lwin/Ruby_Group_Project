class AddFoodTypeImgToFoodTypes < ActiveRecord::Migration[7.0]
  def change
    add_column :food_types, :food_type_img, :string
  end
end
