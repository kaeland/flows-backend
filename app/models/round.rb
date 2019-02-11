class Round < ApplicationRecord
  belongs_to :shift
  belongs_to :plant

  has_many :machine_rounds
  has_many :machines, through: :machine_rounds
end 