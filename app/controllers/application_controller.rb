class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :current_user

  def current_user
    @_current_user ||= RSpotify::User.new(session[:user_hash]) if session[:user_hash]
  end

  def current_character
    @_current_character ||= session[:character] if session[:character] 
  end

  def current_playlist 
    @_current_playlist ||= session[:playlist] if session[:playlist]
  end
end
