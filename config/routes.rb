Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'prods#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :prices
  resources :prods do
    resources :prices
  end
end
