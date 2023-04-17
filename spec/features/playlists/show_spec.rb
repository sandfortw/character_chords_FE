# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Playlist Show Page', type: :feature do
  let(:params) { { theme_id: 1, character_id: 1, playlist_id: 1 } }
  describe 'As a logged in user', :vcr do
    context 'When I visit my playlist show page' do
      before do
        @playlist_json = { links: { image: 'https://media.npr.org/assets/img/2022/07/22/bcs_609_gl_1005_0864-rt_wide-c958ce0b1e351340c63e2f5823f499afe3fbf840-s1600-c85.webp' },
                           data: { type: 'playlist',
                                   genre: 'hip-hop',
                                   id: '1',
                                   attributes: { character_name: 'Saul Goodman',
                                                 quiz_theme: 'lawyer',
                                                 character_alignment: 'Chaotic Neutral',
                                                 song_titles: ['Money Longer by Lil Uzi Vert',
                                                               "I Don't Like by Chief Keef",
                                                               'Famous by Kanye West',
                                                               'Flexicution by Logic',
                                                               'No Role Modelz by J. Cole',
                                                               'HUMBLE. by Kendrick Lamar',
                                                               'Backseat Freestyle by Kendrick Lamar',
                                                               'Panda by Desiigner',
                                                               'Bodak Yellow by Cardi B',
                                                               'Mask Off by Future'] } } }
        @character_data =
          { 'links' => { 'image' => 'https://upload.wikimedia.org/wikipedia/commons/b/ba/Michael_Cohen_in_2019.png' },
            'data' => { 'type' => 'character', 'theme_id' => 1,
                        'attributes' => { 'name' => 'Michael Cohen', 'quiz' => 'lawyer', 'alignment' => 'Neutral Evil' } } }

        @all_character_data = [{ 'links' => { 'image' => 'https://upload.wikimedia.org/wikipedia/commons/b/ba/Michael_Cohen_in_2019.png' }, 'data' => { 'type' => 'character', 'theme_id' => 1, 'attributes' => { 'character_id' => '8', 'name' => 'Michael Cohen', 'quiz' => 'lawyer', 'alignment' => 'Neutral Evil' } } },

                               { 'links' => { 'image' => 'www.roycohnlink.com' },
                                 'data' => { 'type' => 'character', 'theme_id' => 1,
                                             'attributes' => { 'character_id' => '7', 'name' => 'Roy Cohn', 'quiz' => 'lawyer', 'alignment' => 'Lawful Evil' } } },

                               { 'links' => { 'image' => 'www.thurgoodmarshall.com' },
                                 'data' => { 'type' => 'character', 'theme_id' => 1,
                                             'attributes' => { 'theme_id' => '1', 'character_id' => '1', 'name' => 'Thurgood Marshall', 'quiz' => 'lawyer', 'alignment' => 'Lawful Good' } } }]
      end
      it 'should have a link to open with spotify' do
        login_with_oauth
        expect_any_instance_of(ApplicationController).to receive(:current_character).and_return(Character.new(@character_data.deep_symbolize_keys))
        expect_any_instance_of(ApplicationController).to receive(:current_playlist).and_return(Playlist.new(@playlist_json))
        allow_any_instance_of(CharacterFacade).to receive(:all_characters_for_theme_id).and_return([Character.new(@character_data.deep_symbolize_keys)])
        visit '/playlists/1'
        expect(page).to have_link('Open with Spotify')
      end

      describe 'view on the page' do
        before(:each) do
          login_with_oauth

          allow_any_instance_of(ApplicationController).to receive(:current_character).and_return(Character.new(@character_data.deep_symbolize_keys))

          first_call_to_current_playlist = true
          allow_any_instance_of(ApplicationController).to receive(:current_playlist).and_wrap_original do |original_method, *args, &block|
            if first_call_to_current_playlist
              first_call_to_current_playlist = false
              Playlist.new(@playlist_json)
            else
              original_method.call(*args, &block)
            end
          end

          iteration = @all_character_data.map do |character|
            Character.new(character.deep_symbolize_keys)
          end

          allow_any_instance_of(CharacterFacade).to receive(:all_characters_for_theme_id).and_return(iteration)

          visit '/playlists/1'
        end
        it 'there is a location to remix the songs' do
          expect(page).to have_content("Don't like what you see? Remix your playlist")
          expect(page).to have_content('Genre')
          expect(page).to have_button('Create Playlist')

          expect(page).to have_select('character_select',
                                      with_options: ['Michael Cohen', 'Roy Cohn', 'Thurgood Marshall'])
        end

        it 'when you select the character and fill in the genre, it will regenerate a new playlist' do
          select 'Thurgood Marshall', from: 'character_select'
          expect(page).to have_select('character_select', selected: 'Thurgood Marshall')

          fill_in :query, with: 'rock'
          click_button('Create Playlist')
          expect(current_path).to match(%r{/playlists/\d+})
          expect(page).to have_css('div.song', count: 10)
          prohibited_songs = [
            'Money Longer by Lil Uzi Vert',
            "I Don't Like by Chief Keef",
            'Famous by Kanye West',
            'Flexicution by Logic',
            'No Role Modelz by J. Cole',
            'HUMBLE. by Kendrick Lamar',
            'Backseat Freestyle by Kendrick Lamar',
            'Panda by Desiigner',
            'Bodak Yellow by Cardi B',
            'Mask Off by Future'
          ]

          prohibited_songs.each do |song_name|
            expect(page).not_to have_css('li', text: song_name)
          end
        end
      end
    end
  end
end
