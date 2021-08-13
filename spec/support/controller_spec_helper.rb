module ControllerSpecHelper
  def token_generator(user_id)
    AuthenticationToken.encode(user_id)
  end

  def valid_headers
    {
      'Authorization' => token_generator(user.id),
      'Content-Type' => 'application/json',
    }
  end

  def invalid_headers
    {
      'Authorization' => nil,
      'Content-Type' => 'application/json',
    }
  end
end
