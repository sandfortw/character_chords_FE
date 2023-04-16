class HomeController < ApplicationController

  def index
    require 'pry'; binding.pry
    session[:playlist] = nil 
    require 'pry'; binding.pry
    @quizzes = QuizFacade.new.quizzes
  end
end
