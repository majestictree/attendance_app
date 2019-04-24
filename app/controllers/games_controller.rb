class GamesController < ApplicationController
  def index
    @games = Game.where('date >= ?', Date.today - 1).order(date: :asc)
  end

  def new
    @game = Game.new
  end

  def create
    game = Game.new(game_params)
    if game.save
      flash[:success] = "#{game.title}を登録しました"
      redirect_to games_path
    else
      flash[:danger] = game.errors.full_messages
      redirect_to new_game_path(game)
    end
  end

  def edit
    @game = Game.find_by(id: params[:id])
  end

  def update
    game = Game.find_by(id: params[:id])
    if game.update(game_params)
      flash[:success] = "#{game.title}を編集しました"
      redirect_to games_path
    else
      flash[:danger] = game.errors.full_messages
      redirect_to edit_game_path(game)
    end
  end

  def show
    @game = Game.find_by(id: params[:id])
    @players = Player.all.order(:back_number)
    @attendances = @game.attendances
  end

  def destroy
    game = Game.find_by(id: params[:id])
    if game.destroy
      flash[:success] = "#{game.title}を削除しました"
      redirect_to games_path
    else
      flash[:danger] = game.errors.full_messages
      redirect_to games_path
    end
  end

  private
    def game_params
      params.require(:game).permit(:title, :date, :place, :time, :meetingtime)
    end
end
