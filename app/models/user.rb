class User < ApplicationRecord
  has_secure_password
  has_many :attendances
  has_many :workshops, through: :attendances
  validates_presence_of :username, :email, :password
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
