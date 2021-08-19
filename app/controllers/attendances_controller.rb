# frozen_string_literal: true

# Controller for attendances
class AttendancesController < ApplicationController
  before_action :authorize_request

  def index
    @attendances = current_user.attendances
    render json: @attendances, status: :ok
  end

  def create
    attendance = Attendance.create!(attendance_params)
    render json: { message: Message.attendance_created }, status: :created
  end

  private

  def attendance_params
    params.permit(:attendee_id, :attended_workshop_id, :date, :attendance)
  end
end
