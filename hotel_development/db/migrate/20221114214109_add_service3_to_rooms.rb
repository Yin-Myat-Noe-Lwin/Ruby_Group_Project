class AddService3ToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :service3, :string
  end
end
