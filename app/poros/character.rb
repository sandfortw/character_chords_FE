class Character 
  attr_reader :image_url,
              :quiz_id,
              :quiz,
              :name,
              :alignment

  def initialize(data)
    @image_url = data[:links][:image]
    @quiz_id = data[:data][:theme_id]
    @quiz = data[:data][:attributes][:quiz]
    @name = data[:data][:attributes][:name]
    @alignment = data[:data][:attributes][:alignment]
  end
end