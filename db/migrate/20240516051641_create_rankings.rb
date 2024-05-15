class CreateRankings < ActiveRecord::Migration[6.1]
  def change
    create_table :rankings do |t|
      t.integer :movie_id
      t.integer :count

      t.timestamps
    end
  end
end
