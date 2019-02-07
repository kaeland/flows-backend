class RemoveRoundFromMachines < ActiveRecord::Migration[5.2]
  def change
    remove_reference :machines, :round, foreign_key: true
  end
end
