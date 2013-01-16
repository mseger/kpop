Kpop::Application.routes.draw do

  # Facebook auth callbacks
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'


  resources :users

  root to: 'users#index', constraints: SignedInConstraint
  root to: 'users#new'
end
