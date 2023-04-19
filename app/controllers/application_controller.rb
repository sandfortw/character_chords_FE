# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :current_user

  def current_user
    @_current_user ||= RSpotify::User.new(session[:user_hash]) if session[:user_hash]
  end

  def current_character
    if session[:character] && session[:character].class == Hash
      @_current_character ||= Character.new(session[:character].deep_symbolize_keys) 
    else
      @_current_character ||= session[:character]
    end
  end

  def current_characters
    @_current_characters ||= CharacterFacade.new(nil, current_character.theme_id).all_characters_for_theme_id if current_character
  end

  def current_playlist
    current_user ? country = current_user.country : country = "US"
    @_current_playlist ||= Playlist.new(session[:playlist].deep_symbolize_keys, country) if session[:playlist]
  end

end
