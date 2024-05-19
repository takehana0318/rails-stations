# frozen_string_literal: true

# for movie
class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @reservations = Reservation.where(email: current_user.email).all
  end

  def calc_screen
    screen = 1
    (1..3).each do |n|
      if Reservation.exists?(schedule_id: params[:schedule_id], sheet_id: params[:sheet_id], screen_id: n)
        screen = n + 1
      end
    end
    screen
  end

  def create
    screen = calc_screen

    @reservation = Reservation.create(
      schedule_id: params[:schedule_id], sheet_id: params[:sheet_id],
      screen_id: screen, name: params[:name], email: params[:email], date: params[:date]
    )
    redirect_to admin_movies_path
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
