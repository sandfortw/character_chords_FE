class Question 
  attr_reader :id, :name, :spectrum, :quiz, :quiz_id

  def initialize(data, quiz_id)
    @id = data[:id]
    @name = data[:attributes][:name]
    @spectrum = data[:attributes][:spectrum]
    @answers = data[:attributes][:answers]
    @quiz = data[:attributes][:quiz]
    @quiz_id = quiz_id
  end


  def answers
    @answers.map do |answer_data|
      Answer.new(answer_data)
    end
  end
end