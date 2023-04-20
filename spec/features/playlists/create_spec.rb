require 'spec_helper'
require 'rails_helper'

RSpec.describe 'Playlist Create Page', type: :feature do
  describe 'As a logged in user' do
    context 'I visit the characters page to initiate the Playlist creation process' do
      before(:each) do 
        @character_data =
          { 'links' => { 'image' => 'RickRoll.png' },
            'data' => { 'type' => 'character', 'theme_id' => 1,
                        'attributes' => { 'name' => 'Michael Cohen', 'quiz' => 'lawyer', 'alignment' => 'Neutral Evil', 'character_id' => 1 } } }
        
        @all_character_data = [{ 'links' => { 'image' => 'https://upload.wikimedia.org/wikipedia/commons/b/ba/Michael_Cohen_in_2019.png' }, 'data' => { 'type' => 'character', 'theme_id' => 1, 'attributes' => { 'character_id' => '8', 'name' => 'Michael Cohen', 'quiz' => 'lawyer', 'alignment' => 'Neutral Evil' } } },

          { 'links' => { 'image' => 'www.roycohnlink.com' },
            'data' => { 'type' => 'character', 'theme_id' => 1,
                        'attributes' => { 'character_id' => '7', 'name' => 'Roy Cohn', 'quiz' => 'lawyer', 'alignment' => 'Lawful Evil' } } },

          { 'links' => { 'image' => 'www.thurgoodmarshall.com' },
            'data' => { 'type' => 'character', 'theme_id' => 1,
                        'attributes' => { 'theme_id' => '1', 'character_id' => '1', 'name' => 'Thurgood Marshall', 'quiz' => 'lawyer', 'alignment' => 'Lawful Good' } } }]
              
        first_call_to_current_character = true
        allow_any_instance_of(ApplicationController).to receive(:current_character).and_wrap_original do |original_method, *args, &block|
          if first_call_to_current_character
            first_call_to_current_playlist = false
            Character.new(@character_data.deep_symbolize_keys)
          else
            original_method.call(*args, &block)
          end
        end

        allow_any_instance_of(CharacterFacade).to receive(:all_characters_for_theme_id).and_return([Character.new(@character_data.deep_symbolize_keys)])
      end

      it 'assuming the genre is valid, then it will create a playlist and redirect to the playlists page ', :vcr  do

        login_with_oauth
        visit "/characters"
        fill_in :query, with: "disney princess"
        click_button "Create Playlist"
        expect(current_path).to match(/\/playlists\/\d+/)
  
      end

      it "sad path test; if the user puts a genre that is not valid, they are redirected to the previous page and there's a flash message indicating that the genre isn't valid", :vcr do 
        login_with_oauth
        visit "/characters"
        fill_in :query, with: "test query"
        allow_any_instance_of(PlaylistsController).to receive(:genre_valid?).and_return(false)
        click_button "Create Playlist"
        expect(current_path).to match("/characters")
        expect(page).to have_content("Sorry, please enter a genre that is less than 40 characters.")
      end
    end 
  end 
end 
