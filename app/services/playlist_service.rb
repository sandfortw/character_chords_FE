class PlaylistService < ApplicationService
  def get_playlist(hash)
    get_url("#{@@base_url}/chordsapi/v1/themes/#{hash[:theme_id]}/characters/#{hash[:character_id]}/playlists/#{hash[:playlist_id]}")
  end
end