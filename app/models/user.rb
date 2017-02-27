class User < ApplicationRecord
  validates :name, presence: true, length: { in: 3..12 }, uniqueness: true
  validates :email,
            presence: true,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
            uniqueness: true
end
