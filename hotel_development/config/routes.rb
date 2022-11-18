Rails.application.routes.draw do

    root "home#homePage"

    post '/' => "home#search"

    get '/result' => "home#result"

    get '/userProfile' => "home#userProfile"

    resources :view_rooms

    resources :view_foods

    resources :single_rooms

    resources :double_rooms

    resources :luxury_rooms

    resources :deluxe_rooms

    resources :special_rooms
    
    get '/myReservations' => "reservations#myReservations"

    resources :reservations

    resources :bookings

    resources :users

    get '/login' => 'sessions#loginForm'

    post '/login' => "sessions#login"

    delete '/logout' => "sessions#logout"

    get '/dashboard' => 'admins#dashboard'

    get '/showUsers' => 'admins#showUsers'

    get '/profilePage' => 'admins#profilePage'

    resources :room_types

    resources :rooms

    resources :food_types

    resources :foods

    resources :reviews

    resources :tokens

    match '/contacts',     to: 'contacts#new',    via: 'get'
    
    resources "contacts", only: [:new, :create]

end