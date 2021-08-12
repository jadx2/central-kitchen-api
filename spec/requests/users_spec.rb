require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user1) { create(:user) }
  let(:user2) { build(:user) }

  describe 'POST /signup' do
    before {
      post '/signup', params: { username: user2.username, email: user2.email, password: user2.password }
    }

    it 'creates a new user and returns code 201' do
      expect(response).to have_http_status(:created)
    end

    it 'returns a token after signup' do
      expect(JSON.parse(response.body)['token']).not_to be_nil
    end
  end

  describe 'POST /login' do
    before {
      post '/login', params: { email: user1.email, password: user1.password }
    }

    it 'logins user' do
      expect(response).to have_http_status(:created)
    end

    it 'return a token after login' do
      expect(JSON.parse(response.body)['token']).not_to be_nil
    end

    it 'returns error when password is incorrect' do
      post '/login', params: { email: user1.email, password: 'password1' }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
