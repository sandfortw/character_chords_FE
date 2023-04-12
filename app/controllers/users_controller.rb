class UsersController < ApplicationController
  before_action :current_user

  def create
    session[:user_hash] =  request.env['omniauth.auth']
    flash[:success] = "Welcome, #{current_user.display_name}!"
    redirect_to root_path
  end

  def failure
    flash[:error] = "Spotify Login Failed"
    redirect_to root_path
  end
end

