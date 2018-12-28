require 'rails_helper'

RSpec.describe 'Users API', type: :request do

  let(:user){ build(:user) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_attributes) do
    attributes_for(:user)
  end

  # User signup test suite
  describe 'POST /signup' do
    context 'when valid request' do
      before { post '/signup', params: valid_attributes.to_json, headers: headers }

      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Account created successfully/)
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { post '/signup', params: {}, headers: headers }

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
            .to match(/First can't be blank/)
      end
    end
  end

  let!(:show_user){ create(:user) }
  let(:show_headers) { { 'Authorization' => token_generator(show_user.id) } }

  describe 'GET /users/:id' do
    before {
      get "/users/#{show_user.id}", params: {}, headers: show_headers
    }

    context 'when user exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'matches user email' do
        expect(json['email']).to eq(show_user.email)
      end
    end

  end

end