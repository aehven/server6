require 'swagger_helper'

RSpec.describe 'Logging in', type: :request do
  path '/api/v1/user_token' do
    post 'Sign in' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :auth, in: :body, schema: { 
        type: :object,
        properties: {
          auth: { 
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string}
            }
          }
        },
        required: [ 'email', 'password' ]
      } 

      response '201', 'JWT created' do
        let(:auth) { { auth: { email: 'admin@null.com', password: 'password' } } }
        run_test! do |response|
          data = JSON.parse(response.body)
          @@jwt = data['jwt']
          expect(@@jwt).not_to be_nil
        end
      end

      response '404', 'Rejected' do
        let(:auth) { { auth: { email: 'admin@null.com', password: 'wrongpassword' } } }
        run_test!
      end
    end
  end
end

RSpec.describe 'Listing users', type: :request do
  path '/api/v1/users' do
    get 'List users' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :auth, in: :header, type: :string 
      #FIXME we have to call this param auth instead of Authorization because swagger ui clobbers
      #any header with the name 'authorization'.  But the api is really looking for Authorization,
      #see kludge in application_controller#set_up_headers.

      response '200', 'Success' do
        let(:auth) { "Bearer #{@@jwt}" }
        run_test! do |response|
          data = JSON.parse(response.body)
        end
      end

      response '401', 'Unauthorized' do
        let(:auth) { "Bearer #{@@jwt}Q" } #note the 'Q' tacked onto the end of the token to break it.
        run_test!
      end
    end
  end
end

RSpec.describe 'Show user', type: :request do
  path '/api/v1/users/{id}' do
    get 'Show user by id' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :auth, in: :header, type: :string 
      parameter name: :id, in: :path, type: :string

      response '200', 'Success' do
        let(:auth) { "Bearer #{@@jwt}" }
        let(:id) { "1" }
        run_test! do |response|
          data = JSON.parse(response.body)
        end
      end

      response '401', 'Unauthorized' do
        let(:auth) { "Bearer #{@@jwt}Q" } #note the 'Q' tacked onto the end of the token to break it.
        run_test!
      end
    end
  end
end
