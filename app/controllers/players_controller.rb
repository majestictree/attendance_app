class PlayersController < ApplicationController
  def index
    @players = Player.all.order(:back_number)
  end

  def new
    @player = Player.new
  end

  def create
    player = Player.new(player_params)
    player.save
    redirect_to players_path
  end

  def edit
    @player = Player.find_by(id: params[:id])
  end

  def update
    player(params[:id])
    @player.update(player_params)
    redirect_to players_path
  end

  def destroy
    player(params[:id])
    @player.destroy
    redirect_to players_path
  end

  private
    def player_params
      params.require(:player).permit(:back_number, :name)
    end

    def player(player_id)
      @player = Player.find_by(id: player_id)
    end
end
