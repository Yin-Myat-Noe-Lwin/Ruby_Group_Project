class AddRoomToReservations < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :room, index: true
    add_foreign_key :reservations, :rooms
  end
end
