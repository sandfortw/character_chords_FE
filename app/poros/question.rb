class Question 
  attr_reader :id, :name, :spectrum, :quiz

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @spectrum = data[:attributes][:spectrum]
    @answers = data[:attributes][:answers]
    @quiz = data[:attributes][:quiz]
  end


  def answers
    @answers.map do |answer_data|
      Answer.new(answer_data)
    end
  end
end