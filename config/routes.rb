# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  root 'home#index'

  get '/home/clear', to: 'home#clear_playlist_and_character'

  get '/callback', to: 'callback#index'

  resources :quizzes, only: :show
  resources :characters, only: %i[create index]
  resources :playlists, only: %i[create show]

  get '/playlists/:id/open_with_spotify', to: 'playlists#open_with_spotify', as: 'open_with_spotify_playlist'
  get '/auth/spotify/callback', to: 'users#create'
  get 'auth/failure', to: 'users#failure'
  get '/logout', to: 'users#logout'
  resources :quizzes, only: [:show]
end
