class Room < ApplicationRecord

  belongs_to :room_type

  has_one :reservation , dependent: :destroy

  validates_presence_of :room_num

  validates_uniqueness_of :room_num, :case_sensitive => false

  validates :room_num, :length => { :in => 2..30}

  validates_presence_of :status

  validates_presence_of :room_img

  validates_presence_of :room_type_id

end
