class Game < ApplicationRecord
  has_many :attendances
  has_many :players, through: :attendances
end
