# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'MineSweepers', type: :request do
  describe 'GET /resolved action' do
    before do
      VCR.use_cassette('mine_sweeper_generator') do
        get '/resolved'
      end
    end

    it 'returns success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns json response' do
      expect(response.content_type).to include('application/json')
    end
  end
end
