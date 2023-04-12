class QuizFacade

  def initialize(params)
    @params = params
  end

  def quizzes 
    json = QuizService.new.quizzes
    json[:data].map do |simple_quiz_data|
      SimpleQuiz.new(simple_quiz_data)
    end
  end


  def quiz
    json = QuizService.new.quiz(@params)
    Quiz.new(json[:data])
  end
end