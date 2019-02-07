class Round < ApplicationRecord
  has_many :machine_rounds
  has_many :machines, through: :machine_rounds
  has_many :data, through: :machines
  
  has_many :shifts
  has_many :users, through: :shifts
end 