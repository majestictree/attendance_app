class Attendance < ApplicationRecord
  belongs_to :game
  belongs_to :player
  validates :game_id, uniqueness: { scope: :player_id }
end
