Rails.application.routes.draw do
  root 'home#index'

  resources :quizzes, only: :show
  resources :characters, only: [:create, :index]
  resources :playlists, only: [:create, :index, :show]

  get '/playlists/:id/open_with_spotify', to: 'playlists#open_with_spotify', as: 'open_with_spotify_playlist'
  get '/auth/spotify/callback', to: 'users#create'
  get 'auth/failure', to: 'users#failure'
  get '/logout', to: 'users#logout'
  resources :quizzes, only: [:show]
end
