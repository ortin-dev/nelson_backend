class User < ApplicationRecord
  enum role: [:owner, :teammate, :client]

  validates :first_name, :last_name, :email, presence: true
  validates :password, :password_confirmation, presence: true, on: :create
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_secure_password
end
