class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.text :bio
      t.string :avatar
      t.references :manager
      t.timestamps
    end
  end
end
