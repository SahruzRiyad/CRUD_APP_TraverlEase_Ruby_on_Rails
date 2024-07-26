class CreateHotels < ActiveRecord::Migration[7.1]
  def change
    create_table :hotels do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.integer :rating
      t.integer :available_rooms, default: 0
      t.decimal :price_per_night, precision: 10, scale: 2, null: false

      t.timestamps
    end

    add_index :hotels, :location
    add_index :hotels, :rating
  end
end
