class DailyMailer < ApplicationMailer
  # recipient_list = (Rails.env.production? ? User.where(receive_admin_emails: true).pluck(:email) : 'tiago@sistemasc.net')
  def send_question(day)
    @day = day
    @day.responses.each do |response|
      @response = response
      mail(
        subject: "Daily Stand Up for #{day.team.name}",
        to: response.user.email
      )
    end
  end

  ## TODO: send_recap
  def send_recap(day); end
end
