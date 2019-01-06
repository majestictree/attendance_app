class AddIndexToAttendance < ActiveRecord::Migration[5.1]
  def change
    add_index :attendances, [:game_id, :player_id], unique: true
  end
end
