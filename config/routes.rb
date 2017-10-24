Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "/home", to: "tasks#home"

  post "/signup", to: "sessions#signup"

  post "/signin", to: "sessions#signin"

  post "/create", to: "tasks#create"

end
