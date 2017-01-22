Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :places, except: [:update, :edit, :destroy]
  # root 'places#index'

  # get "/jquery.geocomplete.js"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


   get "/", to: "home_pages#home"

  get "/places", to: "places#index"
  get "/places/new", to: "places#new"
  post "/places", to: "places#create"
  get "/places/:id/edit", to: "places#edit"
  patch "/places/:id", to: "places#update"
  get "/places/:id", to: "places#show"
  delete "/places/:id", to: "places#destroy"


  get "/trips", to: "trips#index"
  get "/trips/new", to: "trips#new"
  post "/trips", to: "trips#create"
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

  get "/itinerary/new", to: "itinerary_places#new"
  post "/itinerary/:itinerary_id", to: "itinerary_places#create"

  get "/itinerary/:itinerary_id", to: "itineraries#show"
  get "/itinerary/:itinerary_id/edit", to: "itineraries#edit"
  patch "/itinerary/:itinerary_id", to: "itineraries#update"
  post "/search", to: "itineraries#search"

  get "/itinerary/:itinerary_id/categories/new", to: "categories#new"
  post "/itinerary/:itinerary_id/categories/", to: "categories#create"


  get "/places/:id/expenses/new", to: "expenses#new"
  post "/places/:id/expenses", to: "expenses#create"
  get "places/:id/expenses/:expense_id", to: "expenses#show"

  post "/votes", to: "votes#create"

end
