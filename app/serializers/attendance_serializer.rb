# frozen_string_literal: true

class AttendanceSerializer < ActiveModel::Serializer
  attributes :attended_workshop, :date
  belongs_to :attended_workshop
end
