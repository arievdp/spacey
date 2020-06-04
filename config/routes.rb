Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resource :dashboard, only: [:show]

  get '/about/', to: 'pages#about'
  get '/launch/', to: 'pages#launch'

  resources :rockets do
    resources :orders, only: [:create, :destroy, :edit, :update]
  end

  resources :orders, only: [:show] do
    resources :reviews, only: [:new, :create]
  end

  resources :users, only: :show do
    resources :orders, only: :show
  end
  if Rails.env.development?
    get 'kitchensink', to: 'pages#kitchensink'
  end
end
