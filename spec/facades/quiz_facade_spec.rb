# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QuizFacade do

  describe '#quizzes' do
    it 'returns an array of quizes' do
      expect(QuizFacade.new.quizzes).to be_an Array
      expect(QuizFacade.new.quizzes.first).to be_a Quiz
    end
  end

end
