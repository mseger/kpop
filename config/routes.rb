Kpop::Application.routes.draw do

  get "static/home"

  # Facebook auth callbacks
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'


  resources :users

  resources :matches, constraints: SignedInConstraint
  resources :people, constraints: SignedInConstraint

  match '/generate_matches', to: "main#generate_matches", via: :post, constraints: SignedInConstraint

  root to: 'main#home', constraints: SignedInConstraint
  root to: 'static#home'
end
