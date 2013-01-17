Kpop::Application.routes.draw do

  # Facebook auth callbacks
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'


  resources :users

  resources :starred_matches, constraints: SignedInConstraint
  resources :people, constraints: SignedInConstraint

  root to: 'main#home_li', constraints: SignedInConstraint
  root to: 'main#home_not_li'
end
