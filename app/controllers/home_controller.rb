class HomeController < ApplicationController

  def index
    @quizzes = QuizFacade.new.quizzes
  end
end
