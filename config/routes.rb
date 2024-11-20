Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
    }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/products/new", to: "products#new", as: :new_product
  get "/products/:id/edit", to: "products#edit", as: :edit_product
  patch "/products/:id", to: "products#update"
  delete "/products/:id", to: "products#destroy"
  get "/products/:id", to: "products#show", as: :product
  post "/products", to: "products#create", as: :products

  # Defines the root path route ("/")
  root "products#index"
end
