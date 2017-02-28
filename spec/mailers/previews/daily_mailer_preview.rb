# Preview all emails at http://localhost:3000/rails/mailers/daily_mailer
class DailyMailerPreview < ActionMailer::Preview
  def send_question
    team = Team.first
    future_date = 1.year.from_now
    team.days.where(today: future_date).destroy_all
    day = team.create_day(future_date)
    DailyMailer.send_question(day) unless day.nil?
  end
end
