class RoomType < ApplicationRecord

  has_many :rooms, dependent: :destroy

  validates_presence_of :name

  validates_uniqueness_of :name, :case_sensitive => false

  validates :name, :length => { :in => 5..30}

  validates_presence_of :max_capacity

  validates_presence_of :room_type_img

end