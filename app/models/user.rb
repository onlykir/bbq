class User < ApplicationRecord
  EMAIL_VALID = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :events

  validates :name, presence: true, length: {maximum: 35}
  validates :email, presence: true, length: {maximum: 255},
            uniqueness: true, format: {with: EMAIL_VALID}
end
