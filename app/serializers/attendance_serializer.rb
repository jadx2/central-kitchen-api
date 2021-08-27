class AttendanceSerializer < ActiveModel::Serializer
  attributes :id, :attended_workshop, :date
  belongs_to :attended_workshop
end
