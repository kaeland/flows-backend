class CreateRoundTable < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.string :name
      t.string :time_of_day
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
