class PlaylistService
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
end