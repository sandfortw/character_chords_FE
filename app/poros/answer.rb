class Answer
  attr_reader :letter, :text, :type, :value

  def initialize(data)
    @letter = data.keys.first
    @text = data[@letter][:text]
    @spectrum = data[@letter][:type]
    @value = data[@letter][:value]
  end
end