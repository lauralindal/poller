Rails.application.routes.draw do

  root 'questions#new'

  resources :questions, only: [:new, :show, :create]
  
end
