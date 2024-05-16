class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def calc_screen
    screen = 1
    for n in 1..3
      if Reservation.exists?(schedule_id: params[:schedule_id], sheet_id: params[:sheet_id], screen_id: n)
        screen = n + 1
      end
    end
    return screen
  end

  def create
    screen = calc_screen
    if screen == 4
      redirect_to "/movies/#{params[:movie_id]}/reservation?schedule_id=#{params[:schedule_id]}&date=#{params[:date]}" \
      and return
    end

    @reservation = Reservation.new(
      schedule_id: params[:schedule_id], sheet_id: params[:sheet_id],
      screen_id: screen, name: params[:name], email: params[:email], date: params[:date]
    )
    if @reservation.save
      schedule = Schedule.find(params[:schedule_id])
      #inquiry = Inquiry.new(name: params[:name], message: "#{Theater.find(schedule.theater_id).name} #{Movie.find(params[:movie_id]).name} #{schedule.start_time}")
      #InquiryMailer.send_mail(inquiry, params[:email]).deliver_now
      redirect_to admin_movies_path
    else
      redirect_to "/movies/#{params[:movie_id]}/reservation?schedule_id=#{params[:schedule_id]}&date=#{params[:date]}" \
      and return
    end
  end

  def new
    return unless params[:schedule_id].nil? || params[:date].nil? || params[:sheet_id].nil?

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
