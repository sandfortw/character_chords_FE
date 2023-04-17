# frozen_string_literal: true

class QuestionService < ApplicationService
  def questions(quiz_id)
    get_url("#{ENV['CC_API_URL']}/chordsapi/v1/themes/#{quiz_id}/questions")
  end
end
