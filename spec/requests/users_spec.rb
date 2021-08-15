# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user1) { create(:user) }
  let(:user2) { build(:user) }

  describe 'POST /signup' do
    before do
      post '/signup', params: { username: user2.username, email: user2.email, password: user2.password }
    end

    it 'creates a new user and returns code 201 with success message and token' do
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to match(/Account created successfully/)
      expect(JSON.parse(response.body)['token']).not_to be_nil
    end
  end

  describe 'POST /login' do
    before do
      post '/login', params: { email: user1.email, password: user1.password }
    end

    it 'logins user and returns token' do
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['token']).not_to be_nil
    end

    it 'returns error when password is incorrect' do
      post '/login', params: { email: user1.email, password: 'password1' }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
