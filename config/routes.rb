Rails.application.routes.draw do
  get 'negotiations/index'
  get 'products/index'
  devise_for :users
  root 'products#index'
end
