# Module that handles errors
module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end

  class MissingToken < StandardError; end

  class InvalidToken < StandardError; end

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { error: e.message }, status: :not_found
    end
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ActionController::ParameterMissing, with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two
  end

  private

  def four_twenty_two(err)
    render json: { error: err.message }, status: :unprocessable_entity
  end

  def unauthorized_request(err)
    render json: { error: err.message }, status: :unauthorized
  end
end
