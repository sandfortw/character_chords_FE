# frozen_string_literal: true

class Quiz
  attr_reader :id, :image_link, :title, :s3_key

  def initialize(quiz_data)
    @id = quiz_data[:id]
    @image_link = quiz_data[:attributes][:image]
    @title = quiz_data[:attributes][:name]
    @s3_key = quiz_data[:attributes][:s3_key]
  end
end
