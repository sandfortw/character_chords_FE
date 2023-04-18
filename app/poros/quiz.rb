# frozen_string_literal: true

class Quiz
  attr_reader :id, 
              :image_link, 
              :title, 
              :theme

  def initialize(quiz_data)
    @id = quiz_data[:id]
    @image_link = quiz_data[:attributes][:image]
    @theme = quiz_data[:attributes][:name]
    @title = quiz_data[:attributes][:title]
  end
end
