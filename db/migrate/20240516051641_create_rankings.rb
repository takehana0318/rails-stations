# This shiny device polishes bared foos
class CreateRankings < ActiveRecord::Migration[6.1]
  def change
    create_table :rankings do |t|
      t.integer :movie_id
      t.integer :count
      t.datetime :rank_name

      t.timestamps
    end
  end
end
