Rails.application.routes.draw do
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
