class PlaylistsController < ApplicationController

  def create
    if params[:query].length < 40
      if !params[:remix_character]
        playlist_json = PlaylistFacade.new(params).create_playlists
        session[:playlist] = playlist_json
        redirect_to playlist_path(current_playlist.id)
      else
        remixed =  JSON.parse(params[:remix_character], symbolize_names: true)
        remixed[:query] = params["query"]
        playlist_json = PlaylistFacade.new(remixed).create_playlists
        session[:playlist] = playlist_json
        redirect_to playlist_path(current_playlist.id)
      end   
    else
      flash[:error] = "Sorry, please enter a valid genre that is less than 40 characters."
      redirect_to characters_path
    end  
  end

  def show
    @playlist = current_playlist
    @characters = CharacterFacade.new(nil, current_character.theme_id).all_characters_for_theme_id
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

