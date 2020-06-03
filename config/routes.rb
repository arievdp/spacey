Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/about/', to: 'pages#about'
  resources :rockets do
    resources :orders, only: :create
  end

  resources :orders, only: [:show] do
    resources :reviews, only: [:new, :create]
  end

  resources :users, only: :show do
    resources :orders, only: :show
    collection do
      get :dashboard
    end
  end

end
