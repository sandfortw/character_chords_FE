class Playlist
  attr_reader :image, 
              :genre, 
              :character, 
              :theme, 
              :alignment, 
              :songs
              
  def initialize(data)
    @image = data[:links][:image]
    @genre = data[:data][:genre]
    @character = data[:data][:attributes][:character_name]
    @theme = data[:data][:attributes][:quiz_theme]
    @alignment = data[:data][:attributes][:character_alignment]
    @songs = data[:data][:attributes][:song_titles]
  end
end