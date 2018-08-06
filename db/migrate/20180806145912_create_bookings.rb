class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.text :start_date
      t.text :end_date
      t.references :user, foreign_key: true
      t.references :venue, foreign_key: true

      t.timestamps
    end
  end
end
