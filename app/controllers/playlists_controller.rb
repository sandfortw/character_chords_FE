class PlaylistsController < ApplicationController

  def create
    @playlist_json = PlaylistFacade.new(params).create_playlists
    session[:playlist] = @playlist_json
    redirect_to playlist_path(@playlist_json[:data][:id])
  end

  def show
    @playlist = Playlist.new(current_playlist.deep_symbolize_keys)
  end  

  def open_with_spotify
    spotify_playlist = create_spotify_playlist(current_playlist)
    redirect_to(spotify_playlist.external_urls["spotify"], allow_other_host: true)
  end 

  private
  def create_spotify_playlist(playlist)
    spotify_playlist = current_user.create_playlist!("#{playlist["data"]["attributes"]["character_name"]}, #{playlist["data"]["genre"]} AI Playlist")
    playlist["data"]["attributes"]["song_titles"].each do |song|
      spotify_playlist.add_tracks!(RSpotify::Track.search(song, limit: 1, market: 'US')) 
    end
    spotify_playlist
  end
end