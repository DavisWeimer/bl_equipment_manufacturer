Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/manufacturers', to: 'manufacturers#index'
  get '/manufacturers/:id', to: 'manufacturers#show'
  get 'manufacturers/:id/weapons', to: 'manufacturers#show_weapons'
  get '/weapons', to: 'weapons#index'
  get '/weapons/:id', to: 'weapons#show'
end
