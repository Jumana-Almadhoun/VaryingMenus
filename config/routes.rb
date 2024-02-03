Rails.application.routes.draw do
  root to: "home#index", as: "homepage"
  resources :branches do
    collection do
      get 'nearest/:lat1/:lon1', to: 'branches#nearest', as: 'nearest_branch'
    end
  end
  resources :menus, except: [:destroy]
  resources :orders
  resources :items






end
