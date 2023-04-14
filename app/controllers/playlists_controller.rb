class PlaylistsController < ApplicationController

  def create
    @playlist_json = PlaylistFacade.new(params).create_playlists
    @playlist = Playlist.new(@playlist_json)
    session[:playlist] = @playlist
    render :index
  end

  def index 
    @playlist = session[:playlist]
  end

  def show 
    # @playlist = LOOK UP THE FACADE WITH A 
  end
end