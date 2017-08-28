class Day < ApplicationRecord
  belongs_to :team
  has_many :responses, dependent: :destroy

  after_initialize do
    # due a date + time operaions with time zone, today column must be a datetime, not a simple date
    self.today = Time.zone.today if today.nil?
  end

  def standup_end
    today.to_datetime + Time.zone.parse("#{team.standup_end_hour}:#{team.standup_end_minute}").seconds_since_midnight.seconds
  end
end
