Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root "homes#index"

  devise_for :users
  devise_scope :user do
    post 'users/sales_guest_sign_in', to: 'users/sessions#sales_guest_sign_in'
    post 'users/developer_guest_sign_in', to: 'users/sessions#developer_guest_sign_in'
    post 'users/sales_developer_guest_sign_in', to: 'users/sessions#sales_developer_guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
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
