Rails.application.routes.draw do
  root to: "home#index", as: "homepage"
  resources :branch
  resources :menus, except: [:destroy]
  resources :order
end
