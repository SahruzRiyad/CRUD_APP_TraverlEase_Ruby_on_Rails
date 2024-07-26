class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.string :flight_name
      t.string :flight_type
      t.string :start, null: false
      t.string :destination, null: false
      t.time :departure_time
      t.decimal :total_price, precision: 10, scale: 2, null: false

      t.timestamps
    end

    add_index :flights, :start
    add_index :flights, :destination
  end
end
