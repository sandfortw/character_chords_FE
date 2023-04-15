require 'rails_helper'

RSpec.describe PlaylistFacade do
  let(:params) { { theme_id: 1, character_id: 1, playlist_id: 1 } }
  describe '#playlist' do
    it 'returns an array of songs' do
      playlist_json = {:links=>{:image=>"https://media.npr.org/assets/img/2022/07/22/bcs_609_gl_1005_0864-rt_wide-c958ce0b1e351340c63e2f5823f499afe3fbf840-s1600-c85.webp"},
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
            "Mask Off by Future"]}}}
            
      expect_any_instance_of(PlaylistService).to receive(:get_playlist).and_return(playlist_json)
      expect(PlaylistFacade.new(params).playlist).to be_a(Hash)
    end
  end
end
