class Round < ApplicationRecord
  has_many :machines
  has_many :data, through: :machines
  
  has_many :shifts
  has_many :users, through: :shifts
end 