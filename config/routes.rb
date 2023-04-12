Rails.application.routes.draw do
  root 'home#index'

  get '/auth/spotify/callback', to: 'users#create'
  get 'auth/failure', to: 'users#failure'
end
