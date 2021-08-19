# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe 'Attendances', type: :request do
  let(:user) { create(:user) }
  let(:workshop) { create(:workshop) }
  let(:date) { workshop.dates.first }
  let(:headers) { valid_headers }

  describe 'POST /attendances' do
    before do
      post '/attendances', params: { attendee_id: user.id, attended_workshop_id: workshop.id, date: date },
                           headers: headers
    end

    it 'creates a new attendance and returns 201 and success message' do
      expect(response).to have_http_status(201)
      expect(JSON.parse(response.body)['message']).to match(
        'Attendance Created'
      )
    end

    it 'returns status code 422 when a param is missing' do
      post '/attendances', params: { attendee_id: user.id, attended_workshop_id: workshop.id, date: nil },
                           headers: headers
      expect(response).to have_http_status(422)
    end
  end

  describe 'GET /attendances)' do
    before do
      post '/attendances', params: { attendee_id: user.id, attended_workshop_id: workshop.id, date: date },
                           headers: headers
    end
    it 'returns the users workshops attendances' do
      get '/attendances'
      expect(JSON.parse(response.body)).not_to be_empty
    end
  end
end

# rubocop:enable Metrics/BlockLength
