# frozen_string_literal: true

# for movie
module Admin
  # for movie
  class SchedulesController < ApplicationController
    def index
      @movies = Movie.all
    end

    def show
      @schedule = Schedule.find(params[:id])
    end

    def edit
      @schedule = Schedule.find_by(id: [params[:id]])
    end

    def update
      @schedule = Schedule.find_by(id: [params[:id]])
      if @schedule.update(schedule_params)
        redirect_to admin_schedules_path
      else
        flash.now[:notice] = 'Failed to  post'
        redirect_to edit_admin_schedule_path
      end
    end

    def destroy
      @schedule = Schedule.find_by(id: [params[:id]])
      begin
        @schedule.destroy
        flash[:success] = 'Post is deleted'
        redirect_to admin_schedules_path
      rescue StandardError
        raise ActiveRecord::RecordNotFound
      end
    end

    private

    def schedule_params
      params.require(:schedule).permit(:start_time, :end_time)
    end
  end
end
