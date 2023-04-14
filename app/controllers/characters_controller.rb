class CharactersController < ApplicationController
  before_action :current_character

  def create
    answer_params = params.permit(answers: {})
    quiz_id = params[:quiz_id]
    if answer_params[:answers].to_h.size == params[:question_count]
      character = CharacterFacade.new(answer_params, quiz_id).character
      session[:character] = character
      redirect_to characters_path
    else
      flash[:error] = "All fields must be selected!"
      redirect_to quiz_path(quiz_id)
    end
  end

  def index
    @character = Character.new(current_character.deep_symbolize_keys)
  end
end