class Player < ApplicationRecord
  has_many :attendances, dependent: :destroy
  has_many :games, through: :attendances
end
