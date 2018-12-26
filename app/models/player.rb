class Player < ApplicationRecord
  validates :back_number, uniqueness: true
  belongs_to :game
end
