class CreatePlantTable < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
