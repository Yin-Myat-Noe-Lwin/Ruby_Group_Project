class AddRoomTypeToRooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :rooms, :room_type, index: true
    add_foreign_key :rooms, :room_types
  end
end
