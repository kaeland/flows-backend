class Machine < ApplicationRecord
  belongs_to :plant
  has_many :machine_rounds
  has_many :rounds, through: :machine_rounds

end