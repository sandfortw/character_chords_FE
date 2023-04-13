class CharactersController < ApplicationController

  def create
    answer_params = params.permit(answers: {})
    quiz_id = params[:quiz_id]
    x = CharacterFacade.new(answer_params, quiz_id).character
    require 'pry'; binding.pry
  end

end