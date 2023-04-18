# frozen_string_literal: true

class PlaylistsController < ApplicationController
  def create
    if params[:query].length <= 40 && params[:query].length > 0
      if !params[:remix_character]
        playlist_json = PlaylistFacade.new(params).create_playlists
      else
        session[:character] = current_characters.find { |c| c.character_id.to_s == params[:remix_character] }
        remixed =  paramatize(current_character, params['query'])
        playlist_json = PlaylistFacade.new(remixed).create_playlists
      end
      session[:playlist] = playlist_json
      redirect_to playlist_path(current_playlist.id)
    elsif params[:query].length > 40
      flash[:error] = 'Sorry, please enter a valid genre that is less than 40 characters.'
      redirect_to characters_path
    else
      flash[:error] = 'Genre cannot be empty.'
      redirect_to characters_path
    end
  end

  def show
    @playlist = current_playlist
    @characters = special_sort(current_characters, current_character)                        
  end

  def open_with_spotify
    spotify_playlist = create_spotify_playlist(current_playlist)
    redirect_to(spotify_playlist.external_urls['spotify'], allow_other_host: true)
  end

  private

  def create_spotify_playlist(playlist)
    spotify_playlist = current_user.create_playlist!("#{playlist.character}, #{playlist.genre} AI Playlist")
    spotify_playlist.add_tracks!(playlist.songs)
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
end
