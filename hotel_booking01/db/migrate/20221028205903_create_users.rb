class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name ,  null: false , unique: true
      t.string :email , null: false , unique: true
      t.string :password , null: false
      t.string :password_confirmation , null: false
      t.string :profile , null: false
      t.string :user_type , :limit=> 1 , default: 1 , null: false
      t.timestamps
    end
  end
end