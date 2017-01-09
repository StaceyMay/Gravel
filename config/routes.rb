Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :places, except: [:update, :edit, :destroy]
  # root 'places#index'

  # get "/jquery.geocomplete.js"

  get "/places", to: "places#index"
  get "/places/new", to: "places#new"
  post "/places", to: "places#create"
  get "/places/:id", to: "places#show"
  delete "/places/:id", to: "places#destroy"

  get "/", to: "trips#index"
  get "/trips", to: "trips#index"
  get "/trips/new", to: "trips#new"
  post "/trips/", to: "trips#create"
  get "/trips/:id/edit", to: "trips#edit"
  patch "/trips/:id", to: "trips#update"
  get "/trips/:id", to: "trips#show"
  delete "/trips/:id", to: "trips#destroy"

  post "/user_trips", to: "user_trips#create"
  get "/invite", to: "user_trips#invite"
  post "/invited", to: "user_trips#add_to_trip"

  get "/trips/:id/comments/new", to: "trip_comments#new"
  post "/trips/:id/comments", to: "trip_comments#create"

  get "/places/:id/comments/new", to: "place_comments#new"
  post "/places/:id/comments", to: "place_comments#create"


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

end
