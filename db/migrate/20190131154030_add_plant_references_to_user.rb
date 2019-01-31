class AddPlantReferencesToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :plant, foreign_key: true
  end
end
