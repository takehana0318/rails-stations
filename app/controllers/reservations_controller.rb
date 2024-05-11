class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def create
    # @reservation = Reservation.new(reservation_params)
    screen = 1
    for n in 1..3
      if Reservation.exists?(schedule_id: params[:schedule_id], sheet_id: params[:sheet_id], screen_id: n)
        screen = n + 1
      end
    end

    if screen != 4
      @reservation = Reservation.new(
        schedule_id: params[:schedule_id],
        sheet_id: params[:sheet_id],
        screen_id: screen,
        name: params[:name],
        email: params[:email],
        date: params[:date]
      )
      if @reservation.save
        redirect_to admin_movies_path
      else
        redirect_to "/movies/#{movie_params[:movie_id]}/reservation?schedule_id=#{reservation_params[:schedule_id]}&date=#{reservation_params[:date]}" and return
      end
    else
      redirect_to "/movies/#{movie_params[:movie_id]}/reservation?schedule_id=#{reservation_params[:schedule_id]}&date=#{reservation_params[:date]}" and return
    end
  end

  def new
    return unless params[:schedule_id].nil? or params[:date].nil? or params[:sheet_id].nil?

    redirect_to movie_path(params[:movie_id]), status: 302
  end

  private

  def reservation_params
    params.require(:reservation).permit(:schedule_id, :sheet_id, :name, :email, :date)
  end

  def movie_params
    params.require(:reservation).permit(:movie_id)
  end
end
