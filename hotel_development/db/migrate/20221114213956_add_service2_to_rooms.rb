class AddService2ToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :service2, :string
  end
end
