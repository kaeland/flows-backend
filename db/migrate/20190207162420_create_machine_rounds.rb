class CreateMachineRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :machine_rounds do |t|
      t.references :machine, foreign_key: true
      t.references :round, foreign_key: true

      t.timestamps
    end
  end
end
