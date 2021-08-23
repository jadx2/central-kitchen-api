require 'rails_helper'

RSpec.describe 'Authentications', type: :request do
  let(:user) { create(:user) }
  describe 'POST /authentication' do
    before do
      post '/authentication', params: { email: user.email, password: user.password }
    end

    it 'logins user and returns token' do
      expect(response).to have_http_status(:created)
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['token']).not_to be_nil
    end

    it 'returns error when password is incorrect' do
      post '/authentication', params: { email: user.email, password: 'password1' }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
