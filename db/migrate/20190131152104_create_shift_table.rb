class CreateShiftTable < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.references :round, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
