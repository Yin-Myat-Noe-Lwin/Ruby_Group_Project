class AddSizeToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :size, :string  , null: false
  end
end
