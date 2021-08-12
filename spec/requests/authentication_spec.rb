# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  let(:user) { create(:user) }
  describe 'POST /authenticate' do
    it 'authenticates user' do
      post '/authenticate', params: { email: user.email, password: user.password }
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq({ 'token' => 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.L9cfpZiyuc2Vang-wlByixrdvOjoW39HBDiLXRsBxiM' })
    end

    it 'returns error when email is missing' do
      post '/authenticate', params: { password: 'password1' }
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns error when password is missing' do
      post '/authenticate', params: { email: 'ash@email.com' }
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns error when password is incorrect' do
      post '/authenticate', params: { email: user.email, password: 'password1' }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
