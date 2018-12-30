require 'swagger_helper'

describe 'Status API swag' do

  path '/status/check' do

    get 'Checks status of the API' do
      tags 'Status'
      consumes 'application/json'
      produces 'application/json'

      response '200', 'gets status of the api' do
        run_test!
      end
    end

  end

end