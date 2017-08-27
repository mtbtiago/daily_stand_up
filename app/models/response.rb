class Response < ApplicationRecord
  include Slugable

  belongs_to :team
  belongs_to :day
  belongs_to :user

  validates :response_a, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :response_b, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :response_c, presence: true, length: { minimum: 6 }, allow_nil: true

  validate :check_on_time

  before_update do
    self.user_responded = Time.zone.now
  end

  def on_time?
    Time.zone.now < day.standup_end
  end

  private

  def check_on_time
    errors.add(:base, 'Standup has finished') unless on_time?
  end
end
