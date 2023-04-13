class ScoresController < ApplicationController

  def create
    permitted_params = params.permit(answers: {})
    answer_hash =  permitted_params[:answers].to_h
    good_score = good_score(answer_hash)
    lawful_score = lawful_score(answer_hash)
    require 'pry'; binding.pry
    
  end


  private

  def good_score(answer_hash)
    score_calculator(/.*good_evil.*/, answer_hash)
  end

  def lawful_score(answer_hash)
    score_calculator(/.*chaotic_lawful.*/, answer_hash)
  end

  def score_calculator(regex, answer_hash)
    good_array = answer_hash.select { |key, value| key.match(regex) }
    total_score = good_array.values
                            .map(&:to_i)
                            .sum
    total_score / (good_array.length * 4).to_f
  end
end