class FoodType < ApplicationRecord

  has_many :foods, dependent: :destroy

  validates_presence_of :name

  validates_uniqueness_of :name, :case_sensitive => false

  validates :name, :length => { :in => 5..30}
  
end
