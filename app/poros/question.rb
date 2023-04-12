class Question 

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @answers = data[:attributes][:answers]
  end


  def answers
    @answers.map do |answer_data|
      Answer.new(answer_data)
    end
  end
end