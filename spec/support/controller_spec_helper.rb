module ControllerSpecHelper
  def token_generator(user_id)
    AuthenticationToken.encode(user_id)
  end

  def valid_headers
    {
      'Authorization' => token_generator(user.id),
    }
  end
end
