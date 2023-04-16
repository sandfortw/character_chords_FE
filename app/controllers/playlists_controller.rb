class PlaylistsController < ApplicationController

  def create
    require 'pry'; binding.pry
    playlist_json = PlaylistFacade.new(params).create_playlists
    session[:playlist] = playlist_json
    redirect_to playlist_path(current_playlist.id)
  end

  def show
    @playlist = current_playlist
    characters = CharacterFacade.new(nil, current_character.theme_id).all_characters_for_theme_id
    @remaining_characters = characters
    # @remaining_characters = characters.delete_if { |character| character.name == current_character.name }
    require 'pry'; binding.pry
  end  

  def open_with_spotify
    spotify_playlist = create_spotify_playlist(current_playlist)
    redirect_to(spotify_playlist.external_urls["spotify"], allow_other_host: true)
  end 

  private
  def create_spotify_playlist(playlist)
    spotify_playlist = current_user.create_playlist!("#{playlist.character}, #{playlist.genre} AI Playlist")
    playlist.songs.each do |song|
      spotify_playlist.add_tracks!(RSpotify::Track.search(song, limit: 1, market: 'US')) 
    end
    spotify_playlist
  end
end

