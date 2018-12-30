require 'rails_helper'

RSpec.describe 'Status API', type: :request do

  describe 'GET /status/check' do
    context 'when api is alive' do
      before { get "/status/check", params: {}, headers: headers }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'alive is true' do
        expect(json['alive']).to be(true)
      end
    end
  end

end