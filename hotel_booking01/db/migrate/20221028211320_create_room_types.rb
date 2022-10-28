class CreateRoomTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :room_types do |t|
      t.string :name ,  null: false , unique: true
      t.integer :max_capacity , null: false 
      t.string :room_type_img , null:false
      t.timestamps
    end
  end
end