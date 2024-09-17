class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name,  null: false , unique: true
      t.integer :price, null: false 
      t.string :description, null: false 
      t.timestamps
    end
  end
end
