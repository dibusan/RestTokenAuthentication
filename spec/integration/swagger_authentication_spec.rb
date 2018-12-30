require 'swagger_helper'

describe 'Authentication API swag' do

  let!(:user) { create(:user) }
  let(:valid_credentials) do
    {
        email: user.email,
        password: user.password
    }.to_json
  end

  path '/auth/login' do

    post 'Logs in a User' do
      tags 'Authentication'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :credentials, in: :body, schema: {
          type: :object,
          properties: {
              email: { type: :string },
              password: { type: :string }
          },
          required: %w(email password)
      }

      response '200', 'user exists' do
        let(:credentials) { { email: user.email, password: user.password } }
        run_test!
      end
    end

  end

end