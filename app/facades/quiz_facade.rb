class QuizFacade

  def quizzes 
    json = QuizService.new.quizzes
    json.map do |quiz_data|
      Quiz.new(quiz_data)
    end
  end

end