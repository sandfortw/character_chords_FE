# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question do
  let(:question_data) {{
                        :type=>"question",
                        :id=>1,
                        :attributes=>
                        {:name=>"A high-profile client offers you a significant sum of money to represent them in a case where they are clearly guilty. What do you do?",
                          :quiz=>"lawyer",
                          :spectrum=>"good_evil",
                          :answers=>
                          {:A=>{:text=>"Reject the case outright on moral grounds.", :value=>1},
                            :B=>{:text=>"Accept the case but donate the earnings to charity", :value=>2},
                            :C=>{:text=>"Accept the case and do your best to defend the client.", :value=>3},
                            :D=>{:text=>"Accept the case and use any means necessary to win, even if it involves bending the truth.", :value=>4},
                            :E=>{:text=>"Accept the case and actively participate in covering up the client's crimes.", :value=>5}
                          }
                        }
                      }}
  let(:question) { Question.new(question_data, 1)}

  describe 'attr_readers' do
    it 'should have basic attributes' do
      expect(question.id).to eq(1)
      expect(question.name).to eq("A high-profile client offers you a significant sum of money to represent them in a case where they are clearly guilty. What do you do?")
      expect(question.spectrum).to eq("good_evil")
      expect(question.quiz).to eq("lawyer")
      expect(question.quiz_id).to eq(1)
    end
  end

  describe '#answers' do
    it 'should return an array of answers' do
      expect(question.answers).to be_an(Array)
      expect(question.answers.first).to be_an(Answer)
    end
  end
end
