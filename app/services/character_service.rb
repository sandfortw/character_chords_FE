# frozen_string_literal: true

class CharacterService < ApplicationService
  def get_character(hash)
    get_url("#{ENV['CC_API_URL']}/chordsapi/v1/themes/#{hash[:quiz_id]}/characters/find_character?good_evil=#{hash[:good_score]}&lawful_chaotic=#{hash[:lawful_score]}")
  end

  def get_all_characters(theme_id)
    get_url("#{ENV['CC_API_URL']}/chordsapi/v1/themes/#{theme_id}/characters")
  end
end
