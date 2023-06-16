Rails.application.routes.draw do
  root to: "pages#home"
  get "pages/home", to: "pages#home"
  get "pages/sign_up", to: "pages#sign_up"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources : "pages"
end
