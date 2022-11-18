class AddNumOfPplToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :num_of_ppl, :integer , null: false
  end
end
