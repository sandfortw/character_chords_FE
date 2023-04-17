# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QuestionService do
  let(:service) { QuestionService.new }

  describe '#questions(quiz_id)' do
    it 'returns all question for a given quiz', :vcr do
      json = service.questions(1)
      expect(json).to be_a(Hash)
      expect(json[:links][:image]).to be_a(String)
      expect(json[:data]).to be_an(Array)
      expect(json[:data].first).to be_a(Hash)
      expect(json[:data].first[:type]).to eq('question')
      expect(json[:data].first[:id]).to eq(1)

      expect(json[:data].first[:attributes][:name]).to be_a(String)
      expect(json[:data].first[:attributes][:quiz]).to be_a(String)
      expect(json[:data].first[:attributes][:spectrum]).to be_a(String)
      expect(json[:data].first[:attributes][:answers]).to be_a(Hash)

      expect(json[:data].first[:attributes][:answers][:A]).to be_a(Hash)
      expect(json[:data].first[:attributes][:answers][:A][:text]).to be_a(String)
      expect(json[:data].first[:attributes][:answers][:A][:value]).to be_an(Integer)
    end
  end
end
