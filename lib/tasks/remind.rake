namespace :remind do
    desc "reminder"
    task mail_remind: :environment do
        remind_schedule_lists = []
        tomorrow_date = Date.tomorrow.strftime("%F").to_s

        schedules = Schedule.all
        schedules.each do |schedule|
            x = schedule.start_time.to_s.split(" ")[0]
            if x == tomorrow_date
                remind_schedule_lists << schedule.id
            end
        end

        remind_schedule_lists.each do |id|
            reservations = Reservation.where(schedule_id: id)
            reservations.each do |reservation|
                inquiry = Inquiry.new(name: reservation.name, message: Schedule.find(id).start_time)
                InquiryMailer.send_mail(inquiry, reservation.email).deliver_now
            end
        end
    end
end
