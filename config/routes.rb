Rails.application.routes.draw do

  root 'questions#new'

  resources :questions, only: [:new, :show, :create]
  resources :answers, only: [:update]

  get 'signup' => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'


  resources :users

end
