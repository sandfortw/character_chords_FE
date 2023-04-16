class Playlist
  attr_reader :image, 
              :genre, 
              :character, 
              :theme, 
              :alignment, 
              :songs,
              :id
              
  def initialize(data)
    require 'pry'; binding.pry
    @id = data[:data][:id]
    @image = data[:links][:image]
    @genre = data[:data][:genre]
    @character = data[:data][:attributes][:character_name]
    @theme = data[:data][:attributes][:quiz_theme]
    @alignment = data[:data][:attributes][:character_alignment]
    @songs = clean_up(data[:data][:attributes][:song_titles])
  end

  def clean_up(songs)
    songs.map do |song|
      song.gsub(/[^a-zA-Z\s.]+/, '')
    end
  end
end