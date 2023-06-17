Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root 'products#index'

  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    post 'users/admin_guest_sign_in', to: 'users/sessions#new_admin_guest'
  end
  
  resources :departments
  resources :clients
  resources :categories
  resources :products do
    resources :negotiations do
      resources :results
    end
  end

  namespace :request do
    resources :products
  end
end
