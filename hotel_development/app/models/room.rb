class Room < ApplicationRecord

  belongs_to :room_type

  has_one :reservation , dependent: :destroy

  validates_presence_of :room_num

  validates_uniqueness_of :room_num, :case_sensitive => false

  validates :room_num, :length => { :in => 2..30}

  validates_presence_of :status

  validates_presence_of :room_img

  validates_presence_of :room_type_id

  validates_presence_of :size

  validates :size, :length => { :in => 3..15}

  validates_presence_of :service1

  validates :service1, :length => { :in => 0..20}

  validates_presence_of :service2

  validates :service2, :length => { :in => 0..20}

  validates_presence_of :service3

  validates :service3, :length => { :in => 0..10}

end