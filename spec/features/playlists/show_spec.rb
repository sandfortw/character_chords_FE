require 'rails_helper'

RSpec.describe 'Playlist Show Page', type: :feature do
  let(:params) { { theme_id: 1, character_id: 1, playlist_id: 1 } }
  describe 'As a logged in user', :vcr do
    context 'When I visit my playlist show page' do
      before do 
        @playlist_json = {:links=>
          {:image=>
            "https://media.npr.org/assets/img/2022/07/22/bcs_609_gl_1005_0864-rt_wide-c958ce0b1e351340c63e2f5823f499afe3fbf840-s1600-c85.webp"
          },
          :data=>
          {:type=>"playlist",
            :genre=>"hip-hop",
            :id=>"1",
            :attributes=>
            {:character_name=>"Saul Goodman",
              :quiz_theme=>"lawyer",
              :character_alignment=>"Chaotic Neutral",
              :song_titles=>
              ["Money Longer by Lil Uzi Vert",
                "I Don't Like by Chief Keef",
                "Famous by Kanye West",
                "Flexicution by Logic",
                "No Role Modelz by J. Cole",
                "HUMBLE. by Kendrick Lamar",
                "Backseat Freestyle by Kendrick Lamar",
                "Panda by Desiigner",
                "Bodak Yellow by Cardi B",
                "Mask Off by Future"]
              }
            }
          }
          @character_data = 
          {"links"=>{"image"=>"https://upload.wikimedia.org/wikipedia/commons/b/ba/Michael_Cohen_in_2019.png"},
          "data"=>{"type"=>"character", "theme_id"=>1, "attributes"=>{"name"=>"Michael Cohen", "quiz"=>"lawyer", "alignment"=>"Neutral Evil"}}}
      end
      it 'should have a link to open with spotify' do
        login_with_oauth
        expect_any_instance_of(ApplicationController).to receive(:current_character).and_return(Character.new(@character_data.deep_symbolize_keys))
        expect_any_instance_of(ApplicationController).to receive(:current_playlist).and_return(Playlist.new(@playlist_json))
        allow_any_instance_of(CharacterFacade).to receive(:all_characters_for_theme_id).and_return([Character.new(@character_data.deep_symbolize_keys)])
        visit "/playlists/1"
        expect(page).to have_link('Open with Spotify')
      end
    end
  end
end

