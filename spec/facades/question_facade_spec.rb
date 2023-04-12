# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QuestionFacade do
  let(:params) { { id: 1 } }

  describe '#questions' do
    it 'returns an array of questions' do
      expect(QuestionFacade.new(params).questions).to be_an Array
      expect(QuestionFacade.new(params).questions.first).to be_a Question
    end
  end


end
