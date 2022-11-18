class AddDefaultValueToNumOfPplInReservations < ActiveRecord::Migration[7.0]
  def change
    change_column :reservations, :num_of_ppl, :integer , :default => 1
  end
end
