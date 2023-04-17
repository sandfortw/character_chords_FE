# frozen_string_literal: true

class Character
  attr_reader :image_url,
              :quiz_id,
              :quiz,
              :name,
              :alignment,
              :theme_id,
              :character_id,
              :description

  def initialize(data)
    @image_url = data[:links][:image]
    @quiz_id = data[:data][:theme_id]
    @quiz = data[:data][:attributes][:quiz]
    @name = data[:data][:attributes][:name]
    @alignment = data[:data][:attributes][:alignment]
    @theme_id = data[:data][:theme_id]
    @character_id = data[:data][:attributes][:character_id]
    @description = data[:data][:attributes][:description]
  end
end
