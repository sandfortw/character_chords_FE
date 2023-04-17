# frozen_string_literal: true

class CharacterFacade
  def initialize(answer_params, quiz_id)
    @params = answer_params
    @quiz_id = quiz_id
  end

  def all_characters_for_theme_id
    characters = CharacterService.new.get_all_characters(@quiz_id)
    characters.map do |character|
      Character.new(character)
    end
  end

  def character
    answer_hash = @params[:answers].to_h
    CharacterService.new.get_character({ good_score: good_score(answer_hash), lawful_score: lawful_score(answer_hash),
                                         quiz_id: @quiz_id })
  end

  private

  def good_score(answer_hash)
    score_calculator(/.*good_evil.*/, answer_hash)
  end

  def lawful_score(answer_hash)
    score_calculator(/.*chaotic_lawful.*/, answer_hash)
  end

  def score_calculator(regex, answer_hash)
    good_array = answer_hash.select { |key, _value| key.match(regex) }
    total_score = good_array.values
                            .map(&:to_i)
                            .sum
    (total_score / (good_array.length * 4).to_f).round(2)
  end
end
