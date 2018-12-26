class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.integer :back_number
      t.string :name

      t.timestamps
    end
  end
end
