Rails.application.routes.draw do
  root to: 'pages#home'
  resources :rockets do
    resources :orders, only: :create
  end

  resources :users, except: :index do
    resources :orders, only: [:index, :show, :edit, :update, :destroy] do
      resources :reviews only: [:create, :edit, :update, :destroy]
    end
  end


end
