Rails.application.routes.draw do

    root "home#homePage"

    post '/' => "home#search"

    get '/result' => "home#result"

    resources :view_rooms

    get '/myReservations' => "reservations#myReservations"

    resources :reservations

    resources :bookings

    resources :users

    get '/login' => 'sessions#loginForm'

    post '/login' => "sessions#login"

    get '/logout' => "sessions#logout"

    get '/dashboard' => 'admins#dashboard'

    get '/showUsers' => 'admins#showUsers'

    get '/showReservations' => 'admins#showReservations'

    resources :room_types

    resources :rooms

    resources :food_types

    resources :foods

    resources :reviews

    resources :tokens

end