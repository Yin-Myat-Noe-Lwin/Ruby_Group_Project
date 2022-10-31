Rails.application.routes.draw do

    root "home#homePage"

    resources :users

    get '/login' => 'sessions#loginForm'

    post '/login' => "sessions#login"

    get '/logout' => "sessions#logout"

    get '/dashboard' => 'admins#dashboard'

    get '/showUsers' => 'admins#showUsers'

    resources :room_types

    resources :rooms

    resources :food_types

    resources :foods

end
