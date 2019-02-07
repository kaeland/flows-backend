class DropDataTable < ActiveRecord::Migration[5.2]
  def up 
    drop_table :data 
  end

  def down 
    raise ActiveRecord::IrreversibleMigration
  end
end
