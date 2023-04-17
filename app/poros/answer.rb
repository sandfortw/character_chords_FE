# frozen_string_literal: true

class Answer
  attr_reader :letter, :text, :type, :value

  def initialize(data)
    @letter = data[0].to_s
    @text = data[1][:text]
    @value = data[1][:value]
  end
end
