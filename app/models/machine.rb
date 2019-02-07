class Machine < ApplicationRecord
  belongs_to :plant
  has_many :machine_rounds
  has_many :rounds, through: :machine_rounds

  # Removed the Data table and now storing data on MachineRound table
  # has_many :data
end