class WorkshopsController < ApplicationController
  before_action :set_workshop, only: :show

  def index
    @workshops = Workshop.all
    json_response(@workshops)
  end

  def show
    json_response(@workshop)
  end

  private

  def set_workshop
    @workshop = Workshop.find(params[:id])
  end
end
