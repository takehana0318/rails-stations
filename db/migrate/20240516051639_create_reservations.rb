class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :schedule, null: false, foreign_key: true
      t.references :sheet, null: false, foreign_key: true
      t.references :screen, null: false, foreign_key: true
      t.time :date
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
