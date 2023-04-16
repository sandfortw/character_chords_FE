class PlaylistsController < ApplicationController

  def create
    playlist_json = PlaylistFacade.new(params).create_playlists
    # session[:character] = nil
    session[:playlist] = playlist_json
    require 'pry'; binding.pry
    redirect_to playlist_path(current_playlist.id)
  end

  def show
    require 'pry'; binding.pry
    @playlist = current_playlist
  end  

  def open_with_spotify
    require 'pry'; binding.pry
    spotify_playlist = create_spotify_playlist(current_playlist)
    require 'pry'; binding.pry
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

