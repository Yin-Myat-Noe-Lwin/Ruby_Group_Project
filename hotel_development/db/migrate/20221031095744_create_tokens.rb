class CreateTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :tokens do |t|
      t.string :remember_token 
      t.string :password_reset_token
      t.timestamps
    end
  end
end
