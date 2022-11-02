class User < ApplicationRecord

  has_many :reviews, dependent: :destroy

  has_many :tokens, dependent: :destroy

  has_many :reservations, dependent: :destroy
  
end
