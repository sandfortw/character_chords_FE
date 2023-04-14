class PlaylistsController < ApplicationController
  def create
  end

  def index;end

  def show
    @playlist = PlaylistFacade.new(params).playlist
    session[:playlist] = @playlist
  end  

  def open_with_spotify
    create_spotify_playlist(current_playlist)
    playlist = PlaylistFacade.new(params).playlist
    redirect_to playlist.external_urls['spotify']
  end 

  private
  def create_spotify_playlist(playlist)

  end
end