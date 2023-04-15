class PlaylistsController < ApplicationController

  def create
    @playlist_json = PlaylistFacade.new(params).create_playlists
    session[:playlist] = @playlist_json
    redirect_to playlist_path(@playlist_json[:data][:id])
  end

  def show 
    @playlist = Playlist.new(session[:playlist].deep_symbolize_keys)
  end
end