class WorkshopsController < ApplicationController
  def index
    @workshops = Workshop.all
    json_response(@workshops)
  end

  private

  def workshop_params
    params.permit(:title, :description, :dates, :image)
  end

  def set_workshop
    @workshop = Workshop.find(params[:id])
  end
end
