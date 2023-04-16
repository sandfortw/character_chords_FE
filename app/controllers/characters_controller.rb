class CharactersController < ApplicationController


  def create
    if answer_params[:answers].to_h.size == params[:question_count].to_i #checks if the count of the questions is the same as the number of submitted answers
      session[:character] = CharacterFacade.new(answer_params, params[:quiz_id]).character
      redirect_to characters_path
    else
      flash[:error] = "All questions must be answered to recive your results"
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