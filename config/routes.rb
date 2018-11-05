Rails.application.routes.draw do
  get 'rentals/update'
  get 'rentals/destroy'
  get 'rentals/index'
  get 'rentals/create'
  get 'movies/index'
  get 'movies/show'
  get 'movies/create'
  get 'movies/update'
  get '/customers', to: "customers#index", as: "customers"
  get 'customers/create'
  get 'customers/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
