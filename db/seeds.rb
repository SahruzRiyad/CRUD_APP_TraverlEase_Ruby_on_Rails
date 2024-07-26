
# Seed Flights
Flight.create!(
  [
    {
      flight_name: "Sunshine Airways Flight 101",
      flight_type: "Commercial",
      start: "Dhaka",
      destination: "Tokyo",
      departure_time: Time.now + 5.days,
      total_price: 350.00
    },
    {
      flight_name: "JetStream Charter Flight 204",
      flight_type: "Private",
      start: "Dhaka",
      destination: "Tokyo",
      departure_time: Time.now + 10.days,
      total_price: 1500.00
    },
    {
      flight_name: "BlueSky Airlines Flight 305",
      flight_type: "Charter",
      start: "Dhaka",
      destination: "Tokyo",
      departure_time: Time.now + 10.days,
      total_price: 2500.00
    },
    {
      flight_name: "JetStream Charter Flight 202",
      flight_type: "Private",
      start: "Delhi",
      destination: "Tokyo",
      departure_time: Time.now + 10.days,
      total_price: 1500.00
    },
    {
      flight_name: "BlueSky Airlines Flight 303",
      flight_type: "Commercial",
      start: "Chicago",
      destination: "Miami",
      departure_time: Time.now + 3.days,
      total_price: 200.00
    }
  ]
)

# Seed Hotels
Hotel.create!(
  [
    {
      name: "Grand Plaza Hotel",
      location: "New York",
      rating: 5,
      available_rooms: 50,
      price_per_night: 300.00,
    },
    {
      name: "Grand Plaza Hotel",
      location: "Dhaka",
      rating: 5,
      available_rooms: 50,
      price_per_night: 600.00,
    },
    {
      name: "Hotel Sundarban",
      location: "Dhaka",
      rating: 5,
      available_rooms: 30,
      price_per_night: 300.00,
    },
    {
      name: "Grand Plaza Hotel",
      location: "Dhaka",
      rating: 5,
      available_rooms: 50,
      price_per_night: 600.00,
    },
    {
      name: "Hotel Relax",
      location: "Dhaka",
      rating: 5,
      available_rooms: 10,
      price_per_night: 100.00,
    },
    {
      name: "Sea Breeze Inn",
      location: "Los Angeles",
      rating: 4,
      available_rooms: 30,
      price_per_night: 150.00,
    },
    {
      name: "Mountain Retreat Lodge",
      location: "Denver",
      rating: 4,
      available_rooms: 20,
      price_per_night: 200.00,
    }
  ]
)


# Seed Hotels
100.times do
  Hotel.create!(
    name: Faker::Company.name + " Hotel",
    location: Faker::Address.city,
    rating: rand(1..5),
    available_rooms: rand(1..100),
    price_per_night: Faker::Commerce.price(range: 50.0..500.0),
  )
end
