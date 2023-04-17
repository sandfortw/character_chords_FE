# frozen_string_literal: true

class QuizService < ApplicationService
  def quizzes
    get_url("#{@@base_url}/chordsapi/v1/themes")
  end
end
