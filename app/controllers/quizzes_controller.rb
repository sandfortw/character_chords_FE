class QuizzesController < ApplicationController

  def show
    @questions = QuestionFacade.new(params).questions
  end
end