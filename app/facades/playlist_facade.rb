class PlaylistFacade
  
  def initialize(params)
    @params = params
  end

  def playlist
    PlaylistService.new.get_playlist(@params) 
  end
end