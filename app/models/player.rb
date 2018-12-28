class Player < ApplicationRecord
  validates :back_number, uniqueness: true
  has_many :attendances
  has_many :games, through: :attendances
end
