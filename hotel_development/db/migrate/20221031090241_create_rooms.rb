class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.integer :room_num , null: false , unique: true
      t.string :status , :limit=> 1 , default: 0 , null: false
      t.string :room_img , null: false
      t.timestamps
    end
  end
end
