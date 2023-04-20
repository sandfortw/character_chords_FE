require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Character Create', type: :feature do
  describe 'character page', :vcr do
    before(:each) do
      character_data =
        { 'links' => { 'image' => 'LawyerCharacters/MichaelCohen.jpeg' },
          'data' => { 'id' => '1', 'type' => 'character', 'theme_id' => 1,
                      'attributes' => { 'name' => 'Michael Cohen', 'quiz' => 'lawyer', 'alignment' => 'Neutral Evil', 'character_id' => '1' } } }
      allow_any_instance_of(ApplicationController).to receive(:current_character).and_return(Character.new(character_data.deep_symbolize_keys))
    end

    it 'after you fill in the quiz answers, your character is generated and displayed to the console on the next screen ' do

      visit '/quizzes/2'
      within('form') do
        choose("answers['1good_evil']", option: '0')
        choose("answers['2good_evil']", option: '0')
        choose("answers['3good_evil']", option: '0')
        choose("answers['4good_evil']", option: '0')
        choose("answers['5good_evil']", option: '0')
        choose("answers['6good_evil']", option: '0')
        choose("answers['7chaotic_lawful']", option: '0')
        choose("answers['8chaotic_lawful']", option: '0')
        choose("answers['9chaotic_lawful']", option: '0')
        choose("answers['10chaotic_lawful']", option: '0')
        choose("answers['11chaotic_lawful']", option: '0')
        choose("answers['12chaotic_lawful']", option: '0')
        click_button("Get your results")
      end 
        expect(current_path).to eq("/characters")
        save_and_open_page
        expect(page).to have_content("You are")
        expect(page).to have_css("img[src]:not([src=''])")
      
    end
  end 
end 