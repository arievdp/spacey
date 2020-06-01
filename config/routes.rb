Rails.application.routes.draw do
  root to: 'pages#home'
  resources :rockets
  resources :users, except: :index
  # resources :orders,
end
