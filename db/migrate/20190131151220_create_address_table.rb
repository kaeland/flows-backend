class CreateAddressTable < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.references :plant, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
