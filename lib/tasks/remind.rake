namespace :remind do
  desc 'reminder'
  task mail_remind: :environment do
    puts 'start remind_mail task'
    remind_schedule_lists = []
    tomorrow_date = Date.tomorrow.strftime('%F').to_s

    schedules = Schedule.all
    schedules.each do |schedule|
      x = schedule.start_time.to_s.split(' ')[0]
      # puts x, tomorrow_date
      remind_schedule_lists << schedule.id if x == tomorrow_date
    end

    # puts remind_schedule_lists
    remind_schedule_lists.each do |id|
      reservations = Reservation.where(schedule_id: id)
      reservations.each do |reservation|
        # puts reservation.schedule_id
        schedule = Schedule.find(reservation.schedule_id)
        # puts schedule.movie_id
        movie = Movie.find(schedule.movie_id).name
        theater_name = Theater.find(schedule.theater_id).name
        screen = Screen.find(reservation.screen_id).id

        inquiry = Inquiry.new(name: reservation.name,
                              message: "#{theater_name}/#{movie}/#{screen}/#{schedule.start_time}")
        InquiryMailer.remind_mail(inquiry, reservation.email).deliver_now
      end
    end
  end
end
