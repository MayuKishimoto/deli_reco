Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root 'products#index'

  devise_for :users
  
  resources :departments
  resources :clients
  resources :categories
  resources :products do
    # collection do
    #   get :search
    # end
    # collection do
    #   get :request_index
    # end
    # member do
    #   get :request_show
    #   patch :request_update
    #   put :request_update
    # end
    resources :negotiations do
      resources :results
    end
  end

  namespace :request do
    resources :products
  end

  # # /sales/products
  # namespace :sales do
  #   resources :products
  # end

  # # /manage/products
  # namespace :manage do
  #   resources :products, except: %i[new create]
  # end

  # # /developer/products
  # namespace :developer do
  #   resources :products, except: %i[new create]
  # end
end
