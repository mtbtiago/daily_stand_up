class Day < ApplicationRecord
  belongs_to :team

  after_initialize do
    self.today = Time.zone.today
  end
end
