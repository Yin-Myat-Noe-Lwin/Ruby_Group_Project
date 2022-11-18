class Food < ApplicationRecord

  belongs_to :food_type

  validates_presence_of :name

  validates_uniqueness_of :name, :case_sensitive => false

  validates :name, :length => { :in => 5..15}

  validates_presence_of :price

  validates_presence_of :description

  validates :description, :length => { :in => 3..200}

  validates_presence_of :food_img

  validates_presence_of :food_type_id

end