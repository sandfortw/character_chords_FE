require 'rails_helper'

# as a logged in user,
# from the playlist show page,
# when I click "open with spotify",
# spotify will attempt to open the desktop client, or the web service,
# where I will see the new playlist that was shown on the playlist show page

# . . .

# As a not-logged-in user I do not see the button to open-with-spotify

# RSpec.describe 'Playlist Show Page', type: :feature do
#   let(:params) { { theme_id: 1, character_id: 1, playlist_id: 1 } }
#   describe 'As a logged in user' do
#     context 'When I visit my playlist show page' do
#       xit 'I can open the playlist in Spotify' do
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
#         # save_and_open_page
#         expect(page).to have_link('Open with Spotify')

#         click_link('Open with Spotify')

#         expect(current_url).to eq(playlist.external_urls['spotify'])
#       end
#     end
#   end
# end