# frozen_string_literal: true

class PlaylistFacade
  def initialize(info)
    @info = info
  end

  def create_playlists
    PlaylistService.new(@info).retrieve_playlist
  end

  def playlist
    PlaylistService.new(@info).get_playlist
  end
end
