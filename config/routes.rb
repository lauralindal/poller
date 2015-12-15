Rails.application.routes.draw do

  root 'questions#new'

  resources :questions, only: [:new, :show, :create]
  resources :answers, only: [:update]

  get 'signup' => 'users#new'

end
