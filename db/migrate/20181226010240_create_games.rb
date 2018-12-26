class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :title
      t.date :date
      t.string :place
      t.time :time

      t.timestamps
    end
  end
end
