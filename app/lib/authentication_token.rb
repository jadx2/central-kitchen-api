# frozen_string_literal: true

# Service for creating token from JWT
class AuthenticationToken
  HMAC_SECRET = Rails.application.secret_key_base
  ALGORITHM_TYPE = 'HS256'

  def self.encode(user_id)
    payload = { user_id: user_id }
    JWT.encode payload, HMAC_SECRET, ALGORITHM_TYPE
  end

  def self.decode(token)
    decoded_token = JWT.decode(token, HMAC_SECRET, { algorithm: ALGORITHM_TYPE })[0]
    HashWithIndifferentAccess.new decoded_token
  end
end
