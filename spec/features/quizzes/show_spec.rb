require "rails_helper"

RSpec.describe 'Quiz Show Page', type: :feature do
  
  describe "When visiting the quiz show page", :vcr do

    before :each do
      visit quiz_path(2)
    end
    
    it " The title of the quiz is show " do
      expect(page).to have_content("ALIGNMENT QUIZ")
    end

    context "When each question is answered and you click submit " do
      it "redirects you to the character index page where you see your results" do
       
        within('form') do
          choose("answers['1good_evil']", option: "0")
          choose("answers['2good_evil']", option: "0")
          choose("answers['3good_evil']", option: "0")
          choose("answers['4good_evil']", option: "0")
          choose("answers['5good_evil']", option: "0")
          choose("answers['6good_evil']", option: "0")
          choose("answers['7chaotic_lawful']", option: "0")
          choose("answers['8chaotic_lawful']", option: "0")
          choose("answers['9chaotic_lawful']", option: "0")
          choose("answers['10chaotic_lawful']", option: "0")
          choose("answers['11chaotic_lawful']", option: "0")
          choose("answers['12chaotic_lawful']", option: "0")
        end
        
        click_button "Get your results"
        expect(current_path).to eq(characters_path)
        expect(page).to have_content("You are Chaotic Evil")
      end
    end

    context "When each question is NOT answered and you click submit" do
      it " redirects you to the quiz show page with a flash message" do

        within('form') do
          choose("answers['1good_evil']", option: "0")
          choose("answers['2good_evil']", option: "0")
          choose("answers['3good_evil']", option: "0")
          choose("answers['4good_evil']", option: "0")
          choose("answers['5good_evil']", option: "0")
          choose("answers['6good_evil']", option: "0")
          choose("answers['7chaotic_lawful']", option: "0")
          choose("answers['8chaotic_lawful']", option: "0")
          choose("answers['9chaotic_lawful']", option: "0")
          choose("answers['10chaotic_lawful']", option: "0")
          choose("answers['11chaotic_lawful']", option: "0")
        end

        click_button "Get your results"
        expect(page).to have_content("All questions must be answered to recive your results")
      end
    end
  end
end
