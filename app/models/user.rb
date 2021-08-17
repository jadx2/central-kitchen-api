# frozen_string_literal: true

# User model
class User < ApplicationRecord
  has_secure_password
  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_workshops, through: :attendances, source: :attended_workshop, class_name: 'Workshop'
  validates_presence_of :username, :email, :password_digest
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def username=(str)
    write_attribute(:username, str.to_s.titleize)
  end
end
