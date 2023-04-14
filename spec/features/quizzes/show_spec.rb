require "rails_helper"

RSpec.describe 'Quiz Show Page', type: :feature do
  
  describe "When visiting the quiz show page" do

    before :each do
      visit quiz_path(2)
    end
    
    it " The title of the quiz is show " do
      expect(page).to have_content("ALIGNMENT QUIZ")
    end
    
  end

  
end
