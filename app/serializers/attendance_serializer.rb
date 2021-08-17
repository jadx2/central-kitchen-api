# frozen_string_literal: true

class AttendanceSerializer < ActiveModel::Serializer
  attributes :attendee_id, :attended_workshop_id, :date
end
