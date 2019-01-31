class CreateMachineTable < ActiveRecord::Migration[5.2]
  def change
    create_table :machines do |t|
      t.string :name
      t.references :plant, foreign_key: true
      t.references :round, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
