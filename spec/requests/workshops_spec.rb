require 'rails_helper'

RSpec.describe 'Workshops API', type: :request do
  let!(:workshops) { create_list(:workshop, 10) }
  let(:workshop_id) { workshops.first.id }

  describe 'GET /workshops' do
    before { get '/workshops' }

    it 'returns workshops' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /workshops/:id' do
    before { get "/workshops/#{workshop_id}" }

    context 'when record exists' do
      it 'returns workshop' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(workshop_id)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
    context 'when the record does not exist' do
      let(:workshop_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Workshop/)
      end
    end
  end
end
