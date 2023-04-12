class ApplicationService 
  def get_url(url)
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end