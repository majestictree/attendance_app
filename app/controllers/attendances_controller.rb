class AttendancesController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @attendance = @game.attendances.build
    @player = Player.find_by(id: params[:player_id])
  end

  def create
    game = Game.find(params[:game_id])
    @attendance = game.attendances.new(attendance_params)
    @attendance.save
    redirect_to game_path(game)
  end

  def edit
    @game = Game.find(params[:game_id])
    @attendance = @game.attendances[0]
    @player = Player.find_by(id: params[:player_id])
  end

  def update
    @attendance = Attendance.find(params[:id])
    @attendance.update(attendance_params)
    redirect_to game_path(params[:game_id])
  end

  private
    def attendance_params
      params.require(:attendance).permit(:attendance, :judge, :comment, :player_id)
    end

end
