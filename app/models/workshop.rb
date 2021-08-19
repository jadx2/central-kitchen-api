# frozen_string_literal: true

class Workshop < ApplicationRecord
  has_many :attendances, foreign_key: :attended_workshop_id
  has_many :attendees, through: :attendances, source: :attendee, class_name: 'User'
end
