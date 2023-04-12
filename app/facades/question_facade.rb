class QuestionFacade

  def initialize(params)
    @params = params
  end

  def questions
    json = QuestionService.new.questions(@params)
    json.map do |question_data|
      Question.new(question_data)
    end
  end

end