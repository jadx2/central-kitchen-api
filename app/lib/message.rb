# frozen_string_literal: true

# Messages global storage
class Message
  def self.not_found(record = 'record')
    "Sorry, #{record} not found."
  end

  def self.invalid_credentials
    'Invalid credentials'
  end

  def self.missing_credentials
    'Email and password must be present'
  end

  def self.invalid_token
    'Invalid token'
  end

  def self.missing_token
    'Missing token'
  end

  def self.unauthorized
    'Unauthorized request'
  end

  def self.account_created
    'Account created successfully'
  end

  def self.attendance_created(attendance)
    "Attendance Created: {workshop: #{attendance.attended_workshop.title}, date: #{attendance.date}}"
  end
end
