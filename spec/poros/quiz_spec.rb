# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Quiz do
  let(:quiz_data) { { type: 'theme', id: 1, attributes: { title: "Which lawyer are you?", name: 'lawyer', image: 'example.com' } } }
  let(:quiz) { Quiz.new(quiz_data) }

  describe 'attr_readers' do
    it 'should have basic attributes' do
      expect(quiz.id).to eq(1)
      expect(quiz.image_link).to eq('example.com')
      expect(quiz.theme).to eq('lawyer')
      expect(quiz.title).to eq('Which lawyer are you?')
    end
  end
end
