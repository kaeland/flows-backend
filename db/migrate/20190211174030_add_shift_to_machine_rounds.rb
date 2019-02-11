class AddShiftToMachineRounds < ActiveRecord::Migration[5.2]
  def change
    add_reference :machine_rounds, :shift, foreign_key: true
  end
end
