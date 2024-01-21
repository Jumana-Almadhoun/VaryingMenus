Rails.application.routes.draw do
  root to: "home#index", as: "homepage"
  resources :branches
  resources :menus, except: [:destroy]
  resources :orders

end
