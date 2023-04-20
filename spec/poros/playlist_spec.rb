# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Playlist do
  let(:playlist_data) do
    { links: { image: 'https://media.npr.org/assets/img/2022/07/22/bcs_609_gl_1005_0864-rt_wide-c958ce0b1e351340c63e2f5823f499afe3fbf840-s1600-c85.webp' },
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
  end
  let(:playlist) { Playlist.new(playlist_data, "US") }

  describe 'attr_readers', :vcr do
    it 'should have attributes' do
      expect(playlist.image).to eq('https://media.npr.org/assets/img/2022/07/22/bcs_609_gl_1005_0864-rt_wide-c958ce0b1e351340c63e2f5823f499afe3fbf840-s1600-c85.webp')
      expect(playlist.genre).to eq('hip-hop')
      expect(playlist.character).to eq('Saul Goodman')
      expect(playlist.theme).to eq('lawyer')
      expect(playlist.alignment).to eq('Chaotic Neutral')
      expect(playlist.songs).to be_an(Array)
    end
  end
end
