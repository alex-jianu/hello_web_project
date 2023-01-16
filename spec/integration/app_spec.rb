require "spec_helper"
require "rack/test"
require_relative "../../app"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

    context "GET /names" do
        it 'returns 200 OK and the names' do
            response = get('/names')

            expect(response.status).to eq(200)
            expect(response.body).to eq('Julia, Mary, Karim')
        end
    end

    context "POST /sort-names" do
        it 'returns 200 OK and an ordered list of names' do
          # Assuming the post with id 1 exists.
          response = post('/sort-names', names: 'Denis,Tim,Alex')
    
          expect(response.status).to eq(200)
          expect(response.body).to eq('Alex,Denis,Tim')
        end
    end
end