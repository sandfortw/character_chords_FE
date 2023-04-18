# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QuizService do
  let(:service) { QuizService.new }

  describe '#quizzes' do
    it 'returns an array of quizzes', :vcr do
      json = service.quizzes
      expect(json).to be_a(Hash)
      expect(json[:data]).to be_an(Array)
      expect(json[:data].first).to be_a(Hash)
      expect(json[:data].first[:type]).to eq('theme')
      expect(json[:data].first[:attributes]).to be_a(Hash)
      expect(json[:data].first[:attributes][:name]).to be_a(String)
      expect(json[:data].first[:attributes][:s3_key]).to be_a(String)
    end
  end
end
