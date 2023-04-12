class QuizService <ApplicationService
  @@base_url = ENV['CC_API_URL'] 
  #^^^Will be localhost:5000, will need to be set
   #differently on heroku with something like 
   #`heroku config:set CC_API_URL=https://calm-bastion-20348.herokuapp.com/` in the terminal
   #to set to a differnt localhost, enter `export CC_API_URL=http://localhost:5000` in terminal


  def quizzes
    get_url("#{@@base_url}/chordsapi/v1/themes")
  end

  def quiz(quiz_id)
    require 'pry'; binding.pry
    get_url("#{@@base_url}/chordsapi/v1/themes/#{quiz_id}/questions")
  end

end