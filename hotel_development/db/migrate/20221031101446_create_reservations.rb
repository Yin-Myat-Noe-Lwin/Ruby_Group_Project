class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :check_in , null: false
      t.date :check_out , null: false
      t.integer :num_of_ppl , null: false
      t.timestamps
    end
  end
end
