# frozen_string_literal: true

class Quiz
  attr_reader :id, :image_link, :title

  def initialize(quiz_data)
    @id = quiz_data[:id]
    @image_link = quiz_data[:attributes][:image]
    @title = quiz_data[:attributes][:name]
  end
end
