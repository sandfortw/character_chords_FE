require 'rails_helper'

RSpec.describe 'Character Index', type: :feature do

  describe 'character page', :vcr do
    before(:each) do 
      character_data = 
      {"links"=>{"image"=>"https://upload.wikimedia.org/wikipedia/commons/b/ba/Michael_Cohen_in_2019.png"},
      "data"=>{"type"=>"character", "theme_id"=>1, "attributes"=>{"name"=>"Michael Cohen", "quiz"=>"lawyer", "alignment"=>"Neutral Evil"}}}

      allow_any_instance_of(ApplicationController).to receive(:current_character).and_return(Character.new(character_data.deep_symbolize_keys))
      visit "/characters"
    end
    
    it "the index page will list the character name, their alignment type, along with a picture of the person" do
      expect(page).to have_content("Michael Cohen")
      expect(page).to have_content("Neutral Evil")
      expect(page).to have_selector("img[src='https://upload.wikimedia.org/wikipedia/commons/b/ba/Michael_Cohen_in_2019.png']")

    end

    it "the page will have a form asking you what type of music you want to have a playlist returned for" do 
      expect(page).to have_content("Enter a genre of music to generate your playlist!")
      expect(page).to have_selector('form')
      expect(page).to have_field(:query)
    end

    context "when logged in" do
      before do
        login_with_oauth
        visit "/characters"
      end
      it 'should have a link, \'logout\'' do
        expect(page).to have_link("Logout")
      end
    end

    context "when logged out" do
      it 'should have a link, Sign in with Spotify' do
        expect(page).to have_link("Sign in with Spotify")
      end

      it 'should return me to the same page when I log in through callback path' do 
        login_with_oauth
        visit auth_spotify_callback_path
        expect(current_path).to eq(characters_path)
      end
    end
  end 
end 


