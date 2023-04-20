class CharactersController < ApplicationController

  def create
    if answer_params[:answers].to_h.size == params[:question_count].to_i 
      session[:character] = CharacterFacade.new(answer_params, params[:quiz_id]).character
      session.delete(:quiz_answers)
      redirect_to characters_path
    else
      session[:quiz_answers] = { params[:quiz_id] => answer_params[:answers] }
      flash[:error] = 'All questions must be answered to receive your results'
      redirect_to quiz_path(params[:quiz_id])
    end
  end

  def index
    @character = current_character
  end

  private


  def answer_params
    params.permit(answers: {})
  end
end
