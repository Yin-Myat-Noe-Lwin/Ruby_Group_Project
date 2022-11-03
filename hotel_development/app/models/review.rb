class Review < ApplicationRecord

  belongs_to :user

  validates_presence_of :comment

  validates :comment, :length => { :in => 1..200}

end
