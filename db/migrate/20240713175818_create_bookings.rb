class CreateBookings < ActiveRecord::Migration[7.1]
  def change
	create_table :bookings do |t|
	t.references :user, null:false, foreign_key: true
	t.string :booking_type
	t.datetime :booking_datetime, null: false
	t.datetime :start_datetime, null: false
	t.datetime :end_datetime
	t.string :status, default: 'pending'
	t.decimal :total_price, precision: 10, scale: 2, null: false
	t.string :payment_status, default: 'unpaid'

    t.timestamps
    end
  end
end

