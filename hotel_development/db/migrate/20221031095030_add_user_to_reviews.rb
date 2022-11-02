class AddUserToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :user, index: true
    add_foreign_key :reviews, :users
  end
end
