class Team < ApplicationRecord
  include Slugable

  has_many :team_users, dependent: :destroy
  has_many :days, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :standup_start_hour, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_or_equal_to: 23 }
  validates :standup_start_minute, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_or_equal_to: 59 }
  validates :standup_end_hour, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_or_equal_to: 23 }
  validates :standup_end_minute, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_or_equal_to: 59 }
  validates :question_a, presence: true, length: { minimum: 10 }
  validates :question_b, presence: true, length: { minimum: 10 }
  validates :question_c, presence: true, length: { minimum: 10 }

  def create_day(date = nil)
    return unless active?
    the_date = (date.nil? ? Time.zone.today : date)
    return if days.find_by(today: the_date)
    day = days.create!(today: the_date)
    team_users.where(active: true).find_each do |team_user|
      next unless team_user.user.active?
      day.responses.create!(team: self, user: team_user.user)
    end
    day
  end

  def send_question(day)
    DailyMailer.send_question(day).deliver_now
  end
end
