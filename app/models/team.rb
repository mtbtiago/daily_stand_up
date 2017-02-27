class Team < ApplicationRecord
  has_many :team_users
  has_many :days

  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :slug, presence: true
  validates :standup_start_hour, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_or_equal_to: 23 }
  validates :standup_start_minute, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_or_equal_to: 59 }
  validates :standup_end_hour, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_or_equal_to: 23 }
  validates :standup_end_minute, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_or_equal_to: 59 }
  validates :question_a, presence: true, length: { minimum: 10 }
  validates :question_b, presence: true, length: { minimum: 10 }
  validates :question_c, presence: true, length: { minimum: 10 }

  after_initialize :after_initialize

  protected

  def after_initialize
    self.slug = SecureRandom.uuid
  end
end
