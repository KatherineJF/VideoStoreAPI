Rails.application.routes.draw do
  get '/customers', to: "customers#index", as: "customers"

  get '/movies', to: "movies#index", as: "movies"
  get '/movies/:id', to: "movies#show", as: "movie"

  post '/movies', to: "movies#create"

  post '/rentals/check-out', to: "rentals#create", as: "rentals"
  post '/rentals/check-in', to: "rentals#update", as: "rental"

end
