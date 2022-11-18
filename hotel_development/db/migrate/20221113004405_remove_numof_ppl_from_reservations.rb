class RemoveNumofPplFromReservations < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :num_of_ppl, :integer
  end
end
