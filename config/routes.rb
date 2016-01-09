Rails.application.routes.draw do
  root to: 'users#index', via: :get
  get 'auth/facebook', as: "auth_provider"

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
