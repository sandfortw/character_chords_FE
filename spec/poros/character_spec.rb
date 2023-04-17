# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Character do
  let(:character_data) do
    { links: { image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Roy_Cohn.jpg/463px-Roy_Cohn.jpg' },
      data: { type: 'character', theme_id: 1,
              attributes: { name: 'Roy Cohn', quiz: 'lawyer', alignment: 'Lawful Evil', description: 'A description' } } }
  end
  let(:character) { Character.new(character_data) }

  describe 'attr_readers' do
    it 'should have attributes' do
      expect(character.image_url).to eq('https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Roy_Cohn.jpg/463px-Roy_Cohn.jpg')
      expect(character.quiz_id).to eq(1)
      expect(character.quiz).to eq('lawyer')
      expect(character.name).to eq('Roy Cohn')
      expect(character.alignment).to eq('Lawful Evil')
      expect(character.description).to eq('A description')
    end
  end
end
