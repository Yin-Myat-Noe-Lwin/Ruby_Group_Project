class CreateFoodTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :food_types do |t|
      t.string :name ,  null: false , unique: true
      t.timestamps
    end
  end
end