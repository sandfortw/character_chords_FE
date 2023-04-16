class HomeController < ApplicationController

  def index
    @quizzes = QuizFacade.new.quizzes
  end

  def clear_playlist_and_character
    session[:playlist] = nil
    session[:character] = nil
    redirect_to root_path
  end
end
