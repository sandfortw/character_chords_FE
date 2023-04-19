# frozen_string_literal: true

class PlaylistsController < ApplicationController
  def create
    if genre_valid?(params[:query])
      create_playlist(params)
    else
      handle_genre_error(params)
    end
  end

  def show
    @playlist = current_playlist
    @characters = special_sort(current_characters, current_character)                        
  end

  def open_with_spotify
    spotify_playlist = create_spotify_playlist(current_playlist)
    require 'pry'; binding.pry
    PlaylistSenderJob.perform_async(current_user.email, spotify_playlist.external_urls['spotify']) if params[:email] == '1'
    redirect_to(spotify_playlist.external_urls['spotify'], allow_other_host: true)
  end

  private

  def create_playlist(params)
    if params[:remix_character]
      remix_playlist(params)
    else
      standard_playlist(params)
    end
  end

  def remix_playlist(params)
    character = current_characters.find { |c| c.character_id.to_s == params[:remix_character] }
    session[:character] = character
    remixed_query = paramatize(character, params[:query])
    create_and_redirect(PlaylistFacade.new(remixed_query))
  end

  def standard_playlist(params)
    create_and_redirect(PlaylistFacade.new(params))
  end

  def create_and_redirect(playlist_facade)
    playlist = playlist_facade.create_playlists
    session[:playlist] = playlist
    redirect_to playlist_path(current_playlist.id)
  end

  def handle_genre_error(params)
    flash[:error] = genre_flash_message(params[:query])
    redirect_to last_path(params)
  end

  def create_spotify_playlist(playlist)
    spotify_playlist = current_user.create_playlist!("#{playlist.character}, #{playlist.genre} AI Playlist")
    spotify_playlist.add_tracks!(playlist.songs)
    session[:spotify_playlist] = spotify_playlist
    spotify_playlist
  end

  def special_sort(all_characters, current_character)
    all_characters.delete_if do |character|
      character.character_id == current_character.character_id.to_i
    end.sort_by { |c| c.name}.unshift(current_character)
  end

  def paramatize(current_char, query)
    {character_id_id: current_char.character_id, :character_name=>current_char.name, :alignment=>current_char.alignment, :theme_id=>current_char.theme_id, :query=>query}
  end

  def genre_valid?(query)
    query.length <= 40 && query.length > 0
  end

  def genre_flash_message(query)
    query.length == 0 ? 'Genre cannot be empty.' : 'Sorry, please enter a genre that is less than 40 characters.'
  end

  def last_path(params)
    params[:remix_character] ? playlist_path(current_playlist.id) : characters_path
  end
end
