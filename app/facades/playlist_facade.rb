class PlaylistFacade 

  def initialize(info)
    @info = info
  end

  def create_playlists
    PlaylistService.new(@info).retrieve_playlist
  end
end