class RemovePasswordResetSentAtFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :password_reset_sent_at, :datetime
  end
end
