# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Workshops', type: :request do
  let!(:workshops) { create_list(:workshop, 10) }
  let(:workshop_id) { workshops.first.id }
  describe 'GET /workshops' do
    before { get '/workshops' }
    it 'returns workshops' do
      expect(json.size).to eq(10)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
  describe 'GET /workshops/:id' do
    before { get "/workshops/#{workshop_id}" }
    it 'returns workshop if exists with status 200' do
      expect(response).to have_http_status(200)
    end
    context 'when the record does not exist' do
      let(:workshop_id) { 100 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end
