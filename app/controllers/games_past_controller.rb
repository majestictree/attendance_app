class GamesPastController < ApplicationController
  def index
    @games = Game.where('date < ?', Date.today - 1).order(date: :asc)
  end
end
