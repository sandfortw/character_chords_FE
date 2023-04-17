# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :current_user

  def current_user
    @_current_user ||= RSpotify::User.new(session[:user_hash]) if session[:user_hash]
  end

  def current_character
    @_current_character ||= Character.new(session[:character].deep_symbolize_keys) if session[:character]
  end

  def current_playlist
    @_current_playlist ||= Playlist.new(session[:playlist].deep_symbolize_keys) if session[:playlist]
  end
end
