class QuestionService < Application_Service


  def questions(quiz_id)
    get_url("#{@@base_url}/chordsapi/v1/themes/#{quiz_id}/questions")
  end

end