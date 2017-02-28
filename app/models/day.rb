class Day < ApplicationRecord
  belongs_to :team
  has_many :responses, dependent: :destroy

  after_initialize do
    self.today = Time.zone.today if today.nil?
  end
end
