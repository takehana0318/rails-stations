# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |n|
  Movie.create!(
    name: "test#{n + 1}",
    year: '1999',
    description: 'description sample',
    image_url: 'https://yahoo.jp',
    is_showing: true
  )
end

for m in %w[a b c]
  5.times do |n|
    Sheet.create!(
      column: n + 1,
      row: m
    )
  end
end

2.times do |n|
  Theater.create!(
    name: "theater#{n + 1}"
  )
end

3.times do |_n|
  Screen.create!(
    theater_id: 1
  )
end

3.times do |_n|
  Screen.create!(
    theater_id: 2
  )
end

Schedule.create!(
  movie_id: 1,
  theater_id: 1,
  start_time: '2024-01-01 12:00:00',
  end_time: '2024-01-01 14:00:00'
)

Schedule.create!(
  movie_id: 1,
  theater_id: 2,
  start_time: '2024-01-01 12:00:00',
  end_time: '2024-01-01 14:00:00'
)