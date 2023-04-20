# frozen_string_literal: true

class QuizzesController < ApplicationController
  def show
    session[:quiz_id] = params[:id]
    @questions = QuestionFacade.new(params).questions
  end
end
