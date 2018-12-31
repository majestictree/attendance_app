class PlayersController < ApplicationController
  def index
    @players = Player.all.order(:back_number)
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      flash[:success] = "#{@player.name}さん(背番号:#{@player.back_number})を登録しました"
      redirect_to players_path
    else
      flash.now[:danger] = @player.errors.full_messages
      render 'new'
    end
  end

  def edit
    @player = Player.find_by(id: params[:id])
  end

  def update
    player = Player.find(params[:id])
    if player.update(player_params)
      flash[:success] = "#{player.name}さん(背番号:#{player.back_number})に編集しました"
      redirect_to players_path
    else
      flash[:danger] = player.errors.full_messages
      redirect_to edit_player_path(player)
    end
  end

  def destroy
    player = Player.find(params[:id])
    if player.destroy
      flash[:success] = "#{player.name}さん(背番号:#{player.back_number})を削除しました"
      redirect_to players_path
    else
      flash[:danger] = player.errors.full_messages
      redirect_to players_path
    end
  end

  private
    def player_params
      params.require(:player).permit(:back_number, :name)
    end
end
