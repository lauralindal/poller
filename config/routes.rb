Rails.application.routes.draw do

  root 'static_pages#home'

  resources :questions, only: [:new, :show, :create]
  resources :answers, only: [:update]

  get 'signup' => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'


  resources :users
  resources :account_activations, only: [:edit]

end
