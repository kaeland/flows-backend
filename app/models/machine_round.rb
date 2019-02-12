class MachineRound < ApplicationRecord
  belongs_to :machine
  belongs_to :round
  belongs_to :shift, optional: true
end
