class CreateDatumTable < ActiveRecord::Migration[5.2]
  def change
    create_table :data do |t|
      t.string :name
      t.decimal :payload
      t.references :machine, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
