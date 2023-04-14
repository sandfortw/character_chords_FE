require 'rails_helper'

RSpec.describe 'Character Index', type: :feature do

  describe 'index home page' do
    before(:each) do 
      character_data = 
      {"links"=>{"image"=>"https://upload.wikimedia.org/wikipedia/commons/b/ba/Michael_Cohen_in_2019.png"},
      "data"=>{"type"=>"character", "theme_id"=>1, "attributes"=>{"name"=>"Michael Cohen", "quiz"=>"lawyer", "alignment"=>"Neutral Evil"}}}

      allow_any_instance_of(CharactersController).to receive(:current_character).and_return(character_data)
    end
    
    it "the index page will list the character name, their alignment type, along with a picture of the person" do
      visit "/characters"
      expect(page).to have_content("Michael Cohen")
      expect(page).to have_content("Neutral Evil")
      expect(page).to have_selector("img[src='https://upload.wikimedia.org/wikipedia/commons/b/ba/Michael_Cohen_in_2019.png']")

    end

    it "the page will have a form asking you what type of music you want to have a playlist returned for" do 
      visit "/characters"
      expect(page).to have_content("Enter a genre of music to generate your playlist!")
      expect(page).to have_selector('form')
      expect(page).to have_field(:query)
    end
  end 
end 