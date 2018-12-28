class GamesController < ApplicationController
  def index
    @games = Game.all.order(date: :desc)
  end

  def new
    @game = Game.new
  end

  def create
    game = Game.new(game_params)
    game.save
    redirect_to games_path
  end

  def edit
    @game = Game.find_by(id: params[:id])
  end

  def update
    game = Game.find_by(id: params[:id])
    game.update(game_params)
    redirect_to game_path(game)
  end

  def show
    @game = Game.find_by(id: params[:id])
    @players = Player.all.order(:back_number)
  end

  def destroy
    @game = Game.find_by(id: params[:id])
    @game.destroy
    redirect_to games_path
  end

  private
    def game_params
      params.require(:game).permit(:title, :date, :place, :time, :meetingtime)
    end
end
