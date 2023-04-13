Rails.application.routes.draw do
  root 'home#index'

  resources :quizzes, only: :show
  resources :characters, only: :create

  get '/auth/spotify/callback', to: 'users#create'
  get 'auth/failure', to: 'users#failure'
end
