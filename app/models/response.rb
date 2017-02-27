class Response < ApplicationRecord
  belongs_to :team
  belongs_to :day
  belongs_to :user
end
