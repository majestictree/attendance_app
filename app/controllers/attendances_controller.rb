class AttendancesController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @attendance = @game.attendances.build
    @player = Player.find_by(id: params[:player_id])
  end

  def create
    game = Game.find(params[:game_id])
    @attendance = game.attendances.new(attendance_params)
    name = Player.find(params[:attendance][:player_id]).name
    if @attendance.save
      flash[:success] = "#{name}さんの出欠情報を登録しました"
      redirect_to game_path(game)
    else
      redirect_to root_url
    end
  end

  def edit
    @game = Game.find(params[:game_id])
    @player = Player.find_by(id: params[:player_id])
    @attendance = @player.attendances.find_by(game_id: @game.id)
  end

  def update
    @attendance = Attendance.find(params[:id])
    if @attendance.update(attendance_params)
      name = Player.find(params[:attendance][:player_id]).name
      flash[:success] = "#{name}さんの出欠情報を編集しました"
      redirect_to game_path(params[:game_id])
    else
      flash[:danger] = "出欠の編集に失敗しました"
      redirect_to game_path(params[:game_id])
    end
  end

  private
    def attendance_params
      params.require(:attendance).permit(:attendance, :judge, :comment, :player_id)
    end

end
