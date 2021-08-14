class AttendancesController < ApplicationController
  def create
    attendance = Attendance.create!(attendance_params)
    render json: { message: Message.attendance_created(attendance) }, status: :created
  end

  private

  def attendance_params
    params.permit(:attendee_id, :attended_workshop_id, :date)
  end
end
