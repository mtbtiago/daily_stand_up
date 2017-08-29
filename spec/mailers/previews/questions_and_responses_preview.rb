# Preview all emails at http://localhost:3000/rails/mailers/questions_and_responses
class QuestionsAndResponsesPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/questions_and_responses/send_questions
  def send_questions
    QuestionsAndResponsesMailer.send_questions
  end

end
