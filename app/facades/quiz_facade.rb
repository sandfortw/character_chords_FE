class QuizFacade

  def quizzes 
    json = QuizService.new.quizzes
    json[:data].map do |quiz_data|
      Quiz.new(quiz_data)
    end
  end

end