class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username, :email, :password
  validates :email, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
end
