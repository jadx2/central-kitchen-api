# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { error: e.message }, status: :not_found
    end

    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two

    rescue_from ActionController::ParameterMissing, with: :four_twenty_two

    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
  end

  private

  def four_twenty_two(e)
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def unauthorized_request(e)
    head :unauthorized
  end
end
