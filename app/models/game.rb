class Game < ApplicationRecord
  has_many :attendances, dependent: :destroy
  has_many :players, through: :attendances

  def start_time
    self.date
  end
end
