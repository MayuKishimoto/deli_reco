Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'products#index'
  devise_for :users
  resources :departments
  resources :clients
  resources :categories
  resources :products, shallow: true do
    resources :negotiations do
      resources :results
    end
  end
end
