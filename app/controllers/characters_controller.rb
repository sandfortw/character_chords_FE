class CharactersController < ApplicationController
  before_action :current_character

  def create
    answer_params = params.permit(answers: {})
    quiz_id = params[:quiz_id]
    session[:character] = CharacterFacade.new(answer_params, quiz_id).character
    redirect_to characters_path
  end

  def index
    @character = current_character
  end
end