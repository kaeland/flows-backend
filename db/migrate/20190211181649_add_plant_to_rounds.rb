class AddPlantToRounds < ActiveRecord::Migration[5.2]
  def change
    add_reference :rounds, :plant, foreign_key: true
  end
end
