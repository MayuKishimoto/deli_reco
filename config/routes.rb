Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root 'products#index'

  devise_for :users
  
  resources :departments
  resources :clients
  resources :categories
  resources :products do
    resources :negotiations do
      resources :results
    end
  end

  namespace :admin do
    resources :products
  end
end
