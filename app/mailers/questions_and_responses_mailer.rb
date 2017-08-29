class QuestionsAndResponsesMailer < ApplicationMailer
  def send_questions(response)
    @response = response
    mail(
      to: @response.user.email,
      subject: "Please fill your responses for today, #{@response.day.today.to_date}"
    )
  end
end
