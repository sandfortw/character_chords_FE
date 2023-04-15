require 'rails_helper'

RSpec.describe PlaylistService do
  let(:params) { { theme_id: 1, character_id: 1, playlist_id: 1 } }
  describe '#get_playlist(hash)' do
    it 'should return a hash with attributes', :vcr do
      json = PlaylistService.new(params).get_playlist 
      expect(json).to be_a(Hash)
      expect(json[:links]).to be_a(Hash)
      expect(json[:links][:image]).to be_a(String)
      expect(json[:data]).to be_a(Hash)
      expect(json[:data][:type]).to eq("playlist")
      expect(json[:data][:genre]).to be_a(String)
      expect(json[:data][:attributes]).to be_a(Hash)
      expect(json[:data][:attributes][:character_name]).to be_a(String)
      expect(json[:data][:attributes][:quiz_theme]).to be_a(String)
      expect(json[:data][:attributes][:character_alignment]).to be_a(String)
      expect(json[:data][:attributes][:song_titles]).to be_a(Array)
      expect(json[:data][:attributes][:song_titles].count).to eq(10)
      json[:data][:attributes][:song_titles].each do |song|
        expect(song).to be_a(String)
      end
    end
  end
end