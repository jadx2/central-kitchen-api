require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  describe 'POST /authenticate' do
    it 'authenticates user' do
      post '/authenticate', params: { email: 'ash@email.com', password: 'password1' }
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq({ 'token' => '123' })
    end

    it 'returns error when email is missing' do
      post '/authenticate', params: { password: 'password1' }
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns error when password is missing' do
      post '/authenticate', params: { email: 'ash@email.com' }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
