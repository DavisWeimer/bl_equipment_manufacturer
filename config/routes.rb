Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/manufacturers", to: "manufacturers#index"
  get "/manufacturers/:id", to: "manufacturers#show"
  get "/manufacturers/:id/weapons", to: "manufacturers#show_weapons"
  get "/weapons", to: "weapons#index"
  get "/weapons/:id", to: "weapons#show"

  get "/new", to: "manufacturers#new"
  post "/manufacturers", to: "manufacturers#create"

  get "/manufacturers/:id/edit", to: "manufacturers#edit"
  patch "/manufacturers/:id", to: "manufacturers#update"
  
  get "/manufacturers/:id/weapons/new", to: "weapons#new"
  post "/manufacturers/:id/weapons", to: "weapons#create"
  
  get "/weapons/:id/edit", to: "weapons#edit"
  patch "/weapons/:id", to: "weapons#update"

  delete "/manufacturers/:id", to: "manufacturers#destroy"
  delete "/weapons/:id", to: "weapons#destroy"
end
