# frozen_string_literal: true

class Playlist
  attr_reader :image,
              :genre,
              :character,
              :theme,
              :alignment,
              :songs,
              :id

  def initialize(data, country)
    @id = data[:data][:id]
    @image = data[:links][:image]
    @genre = data[:data][:genre]
    @character = data[:data][:attributes][:character_name]
    @theme = data[:data][:attributes][:quiz_theme]
    @alignment = data[:data][:attributes][:character_alignment]
    @songs = clean_up(data[:data][:attributes][:song_titles])
    @country = country
  end

  def clean_up(songs)
    if songs && songs.size == 10 
      songs.map do |song|
        if song 
          cleaned_up_song = song.gsub(/[^a-zA-Z\s.]+/, '')
          RSpotify::Track.search(cleaned_up_song, limit: 1, market: @country).first
        else 
          RSpotify::Track.search("Bug Song", limit: 1, market: @country).first
        end
      end
    else
      RSpotify::Track.search("Bug Song", limit: 1, market: @country)
    end
  end
end
