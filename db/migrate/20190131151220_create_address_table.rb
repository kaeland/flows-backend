class CreateAddressTable < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.integer :addressable_id
      t.string :addressable_type
      t.references :plant, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_index :addresses, [:addressable_id, :addressable_type]
  end
end
