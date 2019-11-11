class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.references :superpower, foreign_key: true
      t.references :rentee, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
