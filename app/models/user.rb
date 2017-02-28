class User < ApplicationRecord
  has_many :team_users, dependent: :restrict_with_exception

  validates :name, presence: true, length: { in: 3..12 }, uniqueness: true
  validates :email,
            presence: true,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
            uniqueness: true
end
