# frozen_string_literal: true

class Attendance < ApplicationRecord
  validates_presence_of :attendee_id, :attended_workshop_id, :date
  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_workshop, class_name: 'Workshop'
end
