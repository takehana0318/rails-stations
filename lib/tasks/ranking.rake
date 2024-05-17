namespace :ranking do
  desc 'Rankingを計算するタスク'
  task calc_rank: :environment do
    puts 'calc_rank start'
    today = Date.today
    Ranking.where(rank_name: today).destroy_all
    ranking = {}
    reservations = Reservation.all
    reservations.each do |reservation|
      schedule = Schedule.find(reservation.schedule_id)
      movie_id = schedule.movie_id
      start_time = schedule.start_time
      if start_time.between?(start_time.ago(30.days), Date.today)
        if ranking.key?(movie_id)
          ranking[movie_id] += 1
        else
          ranking[movie_id] = 1
        end
      end
    end

    ranking.each do |k, v|
      Ranking.create!(
        movie_id: k,
        count: v,
        rank_name: today
      )
    end
    puts 'calc_rank end'
  end
end
