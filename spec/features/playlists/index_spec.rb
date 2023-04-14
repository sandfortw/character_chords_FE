require 'rails_helper'

RSpec.describe 'Playlists Index', type: :feature do
  describe 'index home page' do

    before(:each) do 
      character_data = {:links=>{:image=>"https://upload.wikimedia.org/wikipedia/en/3/34/Jimmy_McGill_BCS_S3.png"},
      :data=>{:type=>"character", :theme_id=>1, :attributes=>{:name=>"Saul Goodman", :quiz=>"lawyer", :alignment=>"Chaotic Neutral", :character_id=>6}}}

      allow_any_instance_of(CharactersController).to receive(:current_character).and_return(character_data)
    end

    it "filling out the form on characters page will take me to the create action which creates a playlist", :vcr do
      visit "/characters"
      fill_in :query, with: "90s rap"
      click_button "Create Playlist"
      
      expect(current_path).to eq("/playlists")
      # Finsih writing this test 

    end
  end 
end 