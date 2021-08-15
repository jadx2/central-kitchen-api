# frozen_string_literal: true

# Controller for workshops index and show
class WorkshopsController < ApplicationController
  before_action :set_workshop, only: :show

  def index
    render json: Workshop.all, status: :ok
  end

  def show
    render json: @workshop, status: :ok
  end

  private

  def set_workshop
    @workshop = Workshop.find(params[:id])
  end
end
