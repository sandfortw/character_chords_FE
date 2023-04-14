class PlaylistService < ApplicationService
  def initialize(info)
    @info = info
  end

  def retrieve_playlist
    request_url = "themes/#{@info[:theme_id]}/characters/#{@info[:character_id_id]}/playlists?genre=#{@info[:query]}"
    request(:post, request_url)
  end

  def request(method, url)
    response = connection.send(method) { |req| req.url(url) }
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new(url: "http://localhost:4000/chordsapi/v1/")
  end

  def get_playlist(hash)
    get_url("#{@@base_url}/chordsapi/v1/themes/#{hash[:theme_id]}/characters/#{hash[:character_id]}/playlists/#{hash[:playlist_id]}")
  end
end