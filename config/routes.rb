Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resource :dashboard, only: [:show]
  resources :rockets do
    resources :orders, only: :create
  end

  resources :orders, only: [:new, :create]

  resources :users, except: :index do
    resources :rocket, only: [:new, :create, :edit, :update, :destroy]
    resources :orders, only: [:index, :show, :edit, :update, :destroy] do
      resources :reviews, only: [:create, :edit, :update, :destroy]
    end
  end


end
