Rails.application.routes.draw do
  # Custom routes
  post '/users/login', to: 'users#authLogin', as: 'user_login'
  post '/users/new', to: 'users#create', as: 'user_create'

  post '/flights/create', to: 'flights#create', as: 'add_flight'
  patch 'flights/update' , to: 'flights#update' , as: 'flight'
  
  # Static pages
  get 'home/index'

  get '/users/new'
  get '/users/login'


  get '/flights/search', to: 'flights#search', as: 'search_flight_home'
  get '/flights/flightSearch', to: 'flights#flightSearch', as: 'search_flights'
  get 'flights/index' , to: 'flights#index' , as: 'show_index'
  get 'flights/edit' , to: 'flights#edit' , as: 'edit_flight'
  get 'flights/new' , to: 'flights#new' , as: 'get_new_flight'

  
  delete 'flights/delete' , to: 'flights#destroy', as: 'delete_flight'
  # Users resources with nested bookings
  # resources :users do
  #   resources :bookings, only: [:new, :create, :index, :show]
  # end

  # Root route
  root 'home#index'
end
