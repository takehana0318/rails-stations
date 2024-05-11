class SchedulesController < ApplicationController
  def destroy
    @schedule = Schedule.find_by(id: [params[:id]])
    begin
      @schedule.destroy
      flash[:success] = 'Post is deleted'
      redirect_to admin_schedules_path
    rescue StandardError => e
      raise ActiveRecord::RecordNotFound
    end
  end
end
