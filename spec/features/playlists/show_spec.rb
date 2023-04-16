# require 'rails_helper'

# RSpec.describe 'Playlist Show Page', type: :feature do
#   let(:params) { { theme_id: 1, character_id: 1, playlist_id: 1 } }
#   describe 'As a logged in user' do
#     context 'When I visit my playlist show page' do
#       it 'I can open the playlist in Spotify' do
#         playlist_json = {:links=>
#         {:image=>
#           "https://media.npr.org/assets/img/2022/07/22/bcs_609_gl_1005_0864-rt_wide-c958ce0b1e351340c63e2f5823f499afe3fbf840-s1600-c85.webp"
#         },
#         :data=>
#         {:type=>"playlist",
#           :genre=>"hip-hop",
#           :id=>"1",
#           :attributes=>
#           {:character_name=>"Saul Goodman",
#             :quiz_theme=>"lawyer",
#             :character_alignment=>"Chaotic Neutral",
#             :song_titles=>
#             ["Money Longer by Lil Uzi Vert",
#               "I Don't Like by Chief Keef",
#               "Famous by Kanye West",
#               "Flexicution by Logic",
#               "No Role Modelz by J. Cole",
#               "HUMBLE. by Kendrick Lamar",
#               "Backseat Freestyle by Kendrick Lamar",
#               "Panda by Desiigner",
#               "Bodak Yellow by Cardi B",
#               "Mask Off by Future"]
#             }
#           }
#         }
              
#         expect_any_instance_of(PlaylistFacade).to receive(:playlist).and_return(Playlist.new(playlist_json))
              
#         login_with_oauth

#         visit "/playlists/1"

#         expect(page).to have_link('Open with Spotify')

#         click_link('Open with Spotify')

#         expect(current_url).to eq(playlist.external_urls['spotify'])
#       end
#     end
#   end
# end
# RSpec.describe 'Playlists Index', type: :feature do
#   describe 'index home page' do

#     before(:each) do 
#       character_data = {:links=>{:image=>"https://upload.wikimedia.org/wikipedia/en/3/34/Jimmy_McGill_BCS_S3.png"},
#       :data=>{:type=>"character", :theme_id=>1, :attributes=>{:name=>"Saul Goodman", :quiz=>"lawyer", :alignment=>"Chaotic Neutral", :character_id=>6}}}

#       allow_any_instance_of(CharactersController).to receive(:current_character).and_return(character_data)
#     end

#     it "filling out the form on characters page will take me to the create action which creates a playlist", :vcr do
#       visit "/characters"

#       fill_in :query, with: "90s rap"
#       click_button "Create Playlist"
#       expect(current_path).to match(/\/playlists\/\d+/)      
#       expect(page).to have_content("10 Recommended Songs")
#       expect(page).to have_css('div#song', count: 10)
#       page.all('div.song').each do |song_div|
#         expect(song_div).not_to be_empty
#       end
#     end
#   end 
# end 
