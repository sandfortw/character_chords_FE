class Question 
  attr_reader :id, :name, :spectrum

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @spectrum = data[:attributes][:spectrum]
    @answers = data[:attributes][:answers]
  end


  def answers
    @answers.map do |answer_data|
      Answer.new(answer_data)
    end
  end
end