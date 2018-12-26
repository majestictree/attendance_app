class Player < ApplicationRecord
  validates :back_number, uniqueness: true
end
