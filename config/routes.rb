Rails.application.routes.draw do
  root 'home#index'

  resources :quizzes, only: :show
  resources :characters, only: [:create, :index]
  resources :playlists, only: [:create, :index, :show]

  get '/auth/spotify/callback', to: 'users#create'
  get 'auth/failure', to: 'users#failure'
  get '/logout', to: 'users#logout'
  resources :quizzes, only: [:show]
end
