class AddResetPasswordSentAtToTokens < ActiveRecord::Migration[7.0]
  def change
    add_column :tokens, :reset_password_sent_at, :datetime
  end
end
