class AddUserToTokens < ActiveRecord::Migration[7.0]
  def change
    add_reference :tokens, :user, index: true
    add_foreign_key :tokens, :users
  end
end
