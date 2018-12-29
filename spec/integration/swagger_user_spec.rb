require 'swagger_helper'

describe 'User API' do

  let(:user) { build(:user) }

  path '/signup' do

    post 'Creates a User' do
      tags 'User'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
              first: { type: :string },
              last: { type: :string },
              email: { type: :string },
              password: { type: :string },
              phone: { type: :string },
              stripe_acc_type: { type: :string },
              addr1: { type: :string },
              city: { type: :string },
              state: { type: :string },
              dob_day: { type: :integer },
              dob_month: { type: :integer },
              dob_year: { type: :integer },
              ssn_l4: { type: :integer }
          },
          required: %w(first last email password)
      }

      response '201', 'creates a user' do
        let(:user) { {
            first: 'John',
            last: 'Doe',
            email: 'jd@testmail.com',
            password: '123123'
        } }
        run_test!
      end
    end

  end

end