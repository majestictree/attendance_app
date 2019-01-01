class Player < ApplicationRecord
  has_many :attendances
  has_many :games, through: :attendances
end
