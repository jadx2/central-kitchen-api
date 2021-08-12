# frozen_string_literal: true

class AuthenticationToken
  HMAC_SECRET = Rails.application.secrets.secret_key_base
  ALGORITHM_TYPE = 'HS256'

  def self.call(user_id)
    payload = { user_id: user_id }
    JWT.encode payload, HMAC_SECRET, ALGORITHM_TYPE
  end
end
