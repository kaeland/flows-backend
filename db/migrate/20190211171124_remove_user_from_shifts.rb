class RemoveUserFromShifts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :shifts, :user, foreign_key: true
  end
end
