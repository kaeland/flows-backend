class MachineRound < ApplicationRecord
  belongs_to :machine
  belongs_to :round

  def add_datum(datum)
    
  end
end
