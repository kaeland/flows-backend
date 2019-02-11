class Machine < ApplicationRecord
  belongs_to :plant
  has_many :machine_rounds, dependent: :destroy
  has_many :rounds, through: :machine_rounds
  has_many :shifts, through: :machine_rounds
  
end