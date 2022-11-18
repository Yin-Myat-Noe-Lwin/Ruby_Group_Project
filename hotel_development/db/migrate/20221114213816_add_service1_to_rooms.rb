class AddService1ToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :service1, :string
  end
end
