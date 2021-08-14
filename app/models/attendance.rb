class Attendance < ApplicationRecord
  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_workshop, class_name: 'Workshop'
end
