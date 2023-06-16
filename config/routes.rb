Rails.application.routes.draw do
  root to: "pages#home"
  get "pages/home", to: "pages#home"
  get "pages/sign_up", to: "pages#sign_up"
  get "pages/sign_in", to: "pages#sign_in"
  # get "pages/recipes", to: "recipes#index"
  # get "pages/recipes/new", to: "recipes#new"
  # post "pages/recipes", to: "recipes#create"
  # get "pages/recipes/:id/edit", to: "recipes#edit"
  # patch "pages/recipes/:id", to: "recipes#update"
  # get "pages/recipes/:id", to: "recipes#show"
  # delete "pages/recipes/:id", to: "recipes#destroy"
  resources :recipes
end
