class AddServiceToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :service, :text , null: false ,  :limit => 4294967295
  end
end
