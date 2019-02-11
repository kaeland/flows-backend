class AddShiftToRounds < ActiveRecord::Migration[5.2]
  def change
    add_reference :rounds, :shift, foreign_key: true
  end
end
