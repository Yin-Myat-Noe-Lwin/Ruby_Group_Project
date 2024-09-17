class Reservation < ApplicationRecord

  belongs_to :user
  
  belongs_to :room

  validates_presence_of :check_in

  validates_presence_of :check_out

  validates_presence_of :num_of_ppl

end