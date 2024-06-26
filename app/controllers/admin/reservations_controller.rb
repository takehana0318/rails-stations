# frozen_string_literal: true

# for movie
module Admin
  # for movie
  class ReservationsController < ApplicationController
    def index
      @reservations = Reservation.all
    end

    def show
      @reservation = Reservation.find(params[:id])
      return if @reservation.name.nil? || @reservation.email.nil? || @reservation.schedule_id.nil?

      redirect_to admin_reservations_path
    end

    def create
      @reservation = Reservation.new(reservation_params)
      if @reservation.save
        redirect_to admin_movies_path
      else
        redirect_to admin_movies_path, status: 400
      end
    end

    def edit
      @reservation = Reservation.find(params[:id])
    end

    def update
      @reservation = Reservation.find(params[:id])
      if @reservation.update(reservation_params)
        redirect_to admin_movies_path
      else
        flash[:danger] = 'failed'
        render :edit
      end
    end

    def destroy
      @reservation = Reservation.find(params[:id])
      @reservation.destroy
      redirect_to admin_schedules_path
    end

    private

    def reservation_params
      params.require(:reservation).permit(:schedule_id, :sheet_id, :name, :email, :date)
    end

    def movie_params
      params.require(:reservation).permit(:movie_id)
    end
  end
end
