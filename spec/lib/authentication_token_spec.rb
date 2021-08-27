require 'rails_helper'

RSpec.describe AuthenticationToken do
  describe '.call' do
    let(:token) { described_class.encode(1) }
    it 'returns an authentication token' do
      decoded_token = JWT.decode token, described_class::HMAC_SECRET, true,
                                 { algorithm: described_class::ALGORITHM_TYPE }

      expect(decoded_token).to eq(
        [
          { 'user_id' => 1 },
          { 'alg' => 'HS256' }
        ]
      )
    end
  end
end
