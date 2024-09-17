class ChangeCommentToBeTextInReviews < ActiveRecord::Migration[7.0]

  def change

    change_column :reviews, :comment, :text , :limit => 4294967295
    
  end

end
