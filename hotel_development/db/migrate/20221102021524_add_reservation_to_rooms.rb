class AddReservationToRooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :rooms, :reservation, index: true
    add_foreign_key :rooms, :reservations
  end
end
