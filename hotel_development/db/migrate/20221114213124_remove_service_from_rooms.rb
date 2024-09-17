class RemoveServiceFromRooms < ActiveRecord::Migration[7.0]
  def change
    remove_column :rooms, :service, :string
  end
end
