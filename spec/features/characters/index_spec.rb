# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Character Index', type: :feature do
  describe 'character page', :vcr do
    before(:each) do
      character_data =
        { 'links' => { 'image' => 'LawyerCharacters/MichaelCohen.jpeg' },
          'data' => { 'id' => '1', 'type' => 'character', 'theme_id' => 1,
                      'attributes' => { 'name' => 'Michael Cohen', 'quiz' => 'lawyer', 'alignment' => 'Neutral Evil', 'character_id' => '1' } } }
      # ApplicationController.new
      allow_any_instance_of(ApplicationController).to receive(:current_character).and_return(Character.new(character_data.deep_symbolize_keys))
      visit '/characters'
    end

    it 'the index page will list the character name, their alignment type, along with a picture of the person' do
      
      expect(page).to have_content('Michael Cohen')
      expect(page).to have_content('Neutral Evil')
      expect(page).to have_selector("img[src]:not([src=''])", minimum: 1)
    end

    it 'the page will have a form asking you what type of music you want to have a playlist returned for' do
      expect(page).to have_content("Enter a music genre for a personalized quiz-based playlist!")
      expect(page).to have_selector('form')
      expect(page).to have_field(:query)
    end

    it 'filling out the form on characters page will take me to the create action which creates a playlist', :vcr do
      visit '/characters'
      fill_in :query, with: '90s rap'
      click_button 'Create Playlist'
      expect(current_path).to match(%r{/playlists/\d+})
      expect(page).to have_content('Your Lawful Good + 90s rap, AI generated playlist')
      
      expect(page).to have_css('.songs', count: 10)
      page.all('.song').each do |song_div|
        expect(song_div).to have_css('li', text: /\w+/) # Use 'have_css' with ':text' option to check for text
      end
    end

    context 'when logged in' do
      before do
        login_with_oauth
        visit '/characters'
      end
      it 'should have a link, \'logout\'' do
        expect(page).to have_link('Logout')
      end
    end

    context 'when logged out' do
      it 'should have a link, Sign in with Spotify' do
        expect(page).to have_link('Sign in with Spotify')
      end

      it 'should return me to the same page when I log in through callback path' do
        login_with_oauth
        visit auth_spotify_callback_path
        expect(current_path).to eq(characters_path)
      end
    end
  end
end
