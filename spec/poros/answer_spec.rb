# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Answer do
  let(:answer_data) { [:A, {:text=>"Reject the case outright on moral grounds.", :value=>1}] }
  let(:answer) { Answer.new(answer_data)}

  describe 'attr_readers' do
    it 'should have basic attributes' do
      expect(answer.letter).to eq("A")
      expect(answer.text).to eq("Reject the case outright on moral grounds.")
      expect(answer.value).to eq(1)
    end
  end

end
