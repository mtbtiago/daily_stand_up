require 'rails_helper'

RSpec.describe DailyMailer, type: :mailer do
  before do
    @team = Team.first
    future_date = 1.year.from_now
    @team.days.where(today: future_date).destroy_all
    day = @team.create_day(future_date)
    @email = DailyMailer.send_question(day)
  end
  describe 'when send question' do
    it 'delivers email to team users' do
      @email.deliver_now
      expect(@email.to).to eq [@team.team_users.last.user.email]
    end
  end
end
