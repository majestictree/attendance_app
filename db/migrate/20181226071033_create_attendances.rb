class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.integer :game_id
      t.integer :player_id
      t.string :attendance
      t.string :comment
      t.string :judge

      t.timestamps
    end
  end
end
