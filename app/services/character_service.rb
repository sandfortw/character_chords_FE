class CharacterService < ApplicationService

  def get_character(hash)
    get_url("/chordsapi/v1/themes/#{hash[:quiz_id]}/characters?good_evil=#{hash[:good_score]}&lawful_chaotic=#{hash[:lawful_score]}")
  end
end