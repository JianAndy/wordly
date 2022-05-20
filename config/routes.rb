Rails.application.routes.draw do

  root "wordly#index"

  get "/wordly", to: "wordly#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
