# Controller to authorize requests
class AuthorizeApiRequest
  def initialize(headers = {})
    @headers = headers
  end

  def call
    { user: user }
  end

  private

  attr_reader :headers

  def user
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
  rescue ActiveRecord::RecordNotFound
    raise(
      ExceptionHandler::InvalidToken,
      Message.invalid_token
    )
  end

  def decoded_auth_token
    @decoded_auth_token ||= AuthenticationToken.decode(http_auth_header)
  end

  def http_auth_header
    return headers['Authorization'] if headers['Authorization'].present?

    raise(ExceptionHandler::MissingToken, Message.unauthorized)
  end
end
