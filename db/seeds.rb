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
        year: "1999",
        description: "description sample",
        image_url: "https://yahoo.jp",
        is_showing: true,
    )
end

for m in ["a", "b", "c"]
    5.times do |n|
        Sheet.create!(
            column: n+1,
            row: m,
        )
    end
end