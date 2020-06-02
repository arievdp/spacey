Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :rockets do
    resources :orders, only: :create
  end

  resources :orders, only: :new

  resources :users, except: :index do
    resources :orders, only: [:index, :show, :edit, :update, :destroy] do
      resources :reviews, only: [:create, :edit, :update, :destroy]
    end
  end


end
