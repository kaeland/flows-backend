class AddDataToMachineRounds < ActiveRecord::Migration[5.2]
  def change
    add_column :machine_rounds, :data, :decimal
  end
end
