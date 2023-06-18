Rails.application.routes.draw do
  root to: "pages#home"
  get "pages/home", to: "pages#home"
  # get "pages/sign_up", to: "pages#sign_up"
  # get "pages/sign_in", to: "pages#sign_in"
  # get "/recipes", to: "recipes#index"
  # get "/recipes/new", to: "recipes#new" , as: "new_recipe"
  # post "/recipes", to: "recipes#create"
  # get "/recipes/:id/edit", to: "recipes#edit" , as: "edit_recipe"
  # patch "/recipes/:id", to: "recipes#update"
  # get "/recipes/:id", to: "recipes#show" , as: "recipe"
  # delete "/recipes/:id", to: "recipes#destroy"
  resources :recipes
  get "/signup", to: "chefs#new"
  resources :chefs, except: [:new]
end
