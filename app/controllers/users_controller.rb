# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :current_user

  def create
    session[:user_hash] = request.env['omniauth.auth']
    current_user
    flash[:success] = "Welcome, #{current_user.display_name}!"
    return_to_last_page
  end

  def failure
    flash[:error] = 'Spotify Login Failed'
    redirect_to root_path
  end

  def logout
    session.delete(:user_hash)
    flash[:success] = 'You have been logged out'
    return_to_last_page
  end

  private

  def return_to_last_page
    if current_playlist
      redirect_to playlist_path(current_playlist.id)
    elsif current_character
      redirect_to characters_path
    elsif session[:quiz_id]
      redirect_to quiz_path(session[:quiz_id])
    else
      redirect_to root_path
    end
  end
end
