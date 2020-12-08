Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/users" => "users#index"
    #get "/users" => "users#new"
    post "/users" => "users#create"
    #get "/user/:id" => "user#show"
    #get "/user/:id/:edit" => "/user#edit"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"

    post "/sessions" => "sessions#create"
  end
end
