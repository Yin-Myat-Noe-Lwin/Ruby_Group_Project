class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :comment  , null: false
      t.references :user, null: false 
      t.timestamps
    end
    add_foreign_key :reviews, :users, column: :id
  end
end