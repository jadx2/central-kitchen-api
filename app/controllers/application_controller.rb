# Basic Application controller
class ApplicationController < ActionController::API
  include ExceptionHandler

  attr_reader :current_user

  private

  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
end
