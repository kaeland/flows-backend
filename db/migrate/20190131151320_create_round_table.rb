class CreateRoundTable < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.datetime :time
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
