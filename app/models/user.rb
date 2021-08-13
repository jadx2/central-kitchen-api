class User < ApplicationRecord
  has_secure_password
  has_many :attendances, foreign_key: :attendee_id
  has_many :workshops, through: :attendances
  validates_presence_of :username, :email, :password_digest
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
