class GamesPastController < ApplicationController
  def index
    @games = Game.where('date < ?', Date.today).order(date: :asc)
  end
  
end
