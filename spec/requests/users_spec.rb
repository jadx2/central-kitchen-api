require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { build(:user) }

  describe 'POST /users' do
    before do
      post '/users', params: { username: user.username, email: user.email, password: user.password }
    end

    it 'creates a new user and returns code 201 with success message and token' do
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['token']).not_to be_nil
    end
  end
end
