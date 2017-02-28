class Response < ApplicationRecord
  include Slugable

  belongs_to :team
  belongs_to :day
  belongs_to :user

  validates :response_a, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :response_b, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :response_c, presence: true, length: { minimum: 6 }, allow_nil: true

  before_update do
    self.user_responded = Time.zone.now
  end
end
