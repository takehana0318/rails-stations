class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :theater, null: false, foreign_key: true
      t.time :start_time, null: false
      t.time :end_time, null: false

      t.timestamps
    end
  end
end
