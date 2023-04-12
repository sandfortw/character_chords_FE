require 'rails_helper'


RSpec.describe QuizService do
  let(:service) { QuizService.new }

  describe '#quizzes' do
    it 'returns all quizzes' do
      json = service.quizzes
      expect(json).to be_a(Hash)
      #TODO: WRITE MORE EXPECTATIONS
    end
  end

end