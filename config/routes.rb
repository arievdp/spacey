Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resource :dashboard, only: [:show]

  get '/about/', to: 'pages#about'

  resources :rockets do
    resources :orders, only: [:create, :destroy, :edit, :update]
  end

  resources :orders, only: [:show] do
    resources :reviews, only: [:new, :create]
  end

  resources :users, only: :show do
    resources :orders, only: :show

  end
end
