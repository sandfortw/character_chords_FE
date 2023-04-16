class HomeController < ApplicationController

  def index
    if current_playlist
      redirect_to playlist_path(current_playlist.id)
    elsif current_character
      redirect_to characters_path
    end
    @quizzes = QuizFacade.new.quizzes
  end

  def clear_playlist_and_character
    session[:playlist] = nil
    session[:character] = nil
    redirect_to root_path
  end
end
