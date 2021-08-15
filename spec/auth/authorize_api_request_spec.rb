# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AuthorizeApiRequest do
  let(:user) { create(:user) }
  let(:header) { { 'Authorization' => token_generator(user.id) } }
  subject(:invalid_request_obj) { described_class.new({}) }
  subject(:request_obj) { described_class.new(header) }

  describe '#call' do
    context 'when valid request' do
      it 'returns user object' do
        result = request_obj.call
        expect(result[:user]).to eq(user)
      end
    end

    context 'when missing token' do
      it 'raises a MissingToken error' do
        expect { invalid_request_obj.call }.to raise_error(ExceptionHandler::MissingToken)
      end
    end

    context 'when invalid token' do
      subject(:invalid_request_obj) do
        described_class.new('Authorization' => token_generator(5))
      end

      it 'raises an InvalidToken error' do
        expect { invalid_request_obj.call }.to raise_error(ExceptionHandler::InvalidToken)
      end
    end
  end
end
