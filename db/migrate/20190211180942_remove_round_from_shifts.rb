class RemoveRoundFromShifts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :shifts, :round, foreign_key: true
  end
end
