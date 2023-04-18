# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CharacterService do
  let(:service) { CharacterService.new }
  let(:hash) { { good_score: 0.0, lawful_score: 1.0, quiz_id: '2' } }
  describe '#get_character(hash)' do
    it 'should return a hash with attributes', :vcr do
      json = service.get_character(hash)
      expect(json[:links]).to be_a(Hash)
      expect(json[:links][:image]).to be_a(String)
      expect(json[:data]).to be_a(Hash)
      expect(json[:data][:type]).to eq('character')
      expect(json[:data][:theme_id]).to be_a(Integer)
      expect(json[:data][:attributes][:name]).to be_a(String)
      expect(json[:data][:attributes][:quiz]).to be_a(String)
      expect(json[:data][:attributes][:alignment]).to be_a(String)
    end
  end
end
