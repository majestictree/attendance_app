class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    game = Game.new(game_params)
    game.save
    redirect_to games_path
  end

  def show
    @game = Game.find_by(id: params[:id])
  end

  private
    def game_params
      params.require(:game).permit(:title, :date, :place, :time)
    end
end
