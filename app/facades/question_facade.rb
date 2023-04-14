class QuestionFacade

  def initialize(params)
    @params = params
  end

  def questions
    json = QuestionService.new.questions(@params[:id])
    json[:data].map do |question_data|
      Question.new(question_data, @params[:id])
    end
  end
end