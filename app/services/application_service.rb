class ApplicationService 
  @@base_url = ENV['CC_API_URL'] 
  #^^^Will be localhost:5000, will need to be set
   #differently on heroku with something like 
   #`heroku config:set CC_API_URL=https://calm-bastion-20348.herokuapp.com/` in the terminal
   #to set to a differnt localhost, enter `export CC_API_URL=http://localhost:5000` in terminal

  def get_url(url)
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end