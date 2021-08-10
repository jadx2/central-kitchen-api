require 'rails_helper'

RSpec.describe 'Workshops API', type: :request do
  let!(:workshops) { create_list(:workshop, 10) }

  describe 'GET /workshops' do
    before { get '/workshops' }

    it 'returns workshops' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
  end
end
