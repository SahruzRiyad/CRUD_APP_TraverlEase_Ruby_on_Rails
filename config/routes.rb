Rails.application.routes.draw do
  # Custom routes
  post '/users/login', to: 'users#authLogin', as: 'user_login'
  post '/users/new', to: 'users#create', as: 'user_create'

  post '/flights/create', to: 'flights#create', as: 'add_flight'
  patch 'flights/update' , to: 'flights#update' , as: 'flight'

  post '/hotel/create' , to: 'hotel#create' , as: 'add_hotel'
  patch 'hotel/update' , to: 'hotel#update' , as: 'hotel_update'
  
  # Static pages
  get 'home/index'

  get '/users/new'
  get '/users/login'


  get '/flights/search', to: 'flights#search', as: 'search_flight_home'
  get '/flights/flightSearch', to: 'flights#flightSearch', as: 'search_flights'
  get 'flights/index' , to: 'flights#index' , as: 'show_index'
  get 'flights/edit' , to: 'flights#edit' , as: 'edit_flight'
  get 'flights/new' , to: 'flights#new' , as: 'get_new_flight'

  get 'hotel/index', to: 'hotel#index' , as: 'show_hotel_index'
  get '/hotel/hotelSearch' , to: 'hotel#hotelSearch' , as: 'search_hotels'
  get 'hotel/new' , to: 'hotel#new' , as: 'add_new_hotel'
  get 'hotel/edit', to: 'hotel#edit' , as: 'edit_hotel'

  
  delete 'flights/delete' , to: 'flights#destroy', as: 'delete_flight'

  delete 'hotel/delete' , to: 'hotel#destroy' , as: 'delete_hotel'
  # Users resources with nested bookings
  # resources :users do
  #   resources :bookings, only: [:new, :create, :index, :show]
  # end

  # Root route
  root 'home#index'
end
