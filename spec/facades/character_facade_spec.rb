require 'rails_helper'

RSpec.describe CharacterFacade do
  let(:params) { {answers: {"'1good_evil'"=>"0", "'12chaotic_lawful'"=>"4"}} }
  let(:quiz_id) { "1" }
  let(:facade) {CharacterFacade.new(params, quiz_id)}
  let(:character_hash) {facade.character}
  describe '#character' do
    it 'returns a hash with character info' do
      expect(character_hash).to be_a(Hash)
      expect(character_hash[:links][:image]).to be_a(String)
      expect(character_hash[:data][:theme_id]).to be_an(Integer)
      expect(character_hash[:data][:attributes]).to be_a(Hash)
      expect(character_hash[:data][:attributes][:name]).to be_a(String)
      expect(character_hash[:data][:attributes][:quiz]).to be_a(String)
      expect(character_hash[:data][:attributes][:alignment]).to be_a(String)
    end
  end


end
