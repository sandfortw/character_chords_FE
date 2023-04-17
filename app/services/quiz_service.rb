# frozen_string_literal: true

class QuizService < ApplicationService
  def quizzes
    get_url("#{ENV['CC_API_URL']}/chordsapi/v1/themes")
  end
end
