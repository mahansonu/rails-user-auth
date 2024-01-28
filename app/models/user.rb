class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  normalizes :email, with: -> email {email.strip.downcase}

  generates_token_for :password_reset do
    password_salt&.last(10)
  end
end
