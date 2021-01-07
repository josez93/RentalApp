Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/users" => "users#index"
    #get "/users" => "users#new"
    post "/users" => "users#create"
    get "/users/:id" => "users#show"
    #get "/user/:id/:edit" => "/user#edit"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"
    post "/sessions" => "sessions#create"

    get "/products" => "products#index"
    # get "/products" => "products#new"
    post "/products" => "products#create"
    get "/products/:id" => "products#show"
    # get "/products/:id/:edit" => "products#edit"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"

    get "/products_inventory/" => "products_inventory#show"

    get "/orders" => "orders#index"
    # get "/orders" => "orders#new"
    post "/orders" => "orders#create"
    get "/orders/:id" => "orders#show"
    # get "orders/:id/:edit" => "orders#edit"
    patch "/orders/:id" => "orders#update"
    delete "/orders/:id" => "orders#destroy"

    get "/carted_products" => "carted_products#index"
    post "/carted_products" => "carted_products#create"
    get "/carted_products/:id" => "carted_products#show"
    patch "/carted_products/:id" => "carted_products#update"
    delete "/carted_products/:id" => "carted_products#destroy"
  end
end
