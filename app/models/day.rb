class Day < ApplicationRecord
  belongs_to :team
  has_many :responses, dependent: :destroy

  after_initialize do
    self.today = Time.zone.today if today.nil?
  end

  def standup_end
    today.to_datetime + Time.parse("#{team.standup_end_hour}:#{team.standup_end_minute}").seconds_since_midnight.seconds
  end
end
