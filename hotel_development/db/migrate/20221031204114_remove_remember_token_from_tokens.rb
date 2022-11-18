class RemoveRememberTokenFromTokens < ActiveRecord::Migration[7.0]
  def change
    remove_column :tokens, :remember_token, :string
  end
end
