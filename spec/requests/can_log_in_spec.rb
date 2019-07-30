require "rails_helper"

describe 'user can login', type: :request do
  it 'via a post request' do
    User.create!(email: "whatever@example.com", password: "password")
    body = {"email": "whatever@example.com", "password": "password" }

    post '/api/v1/sessions', :params => body

    results = JSON.parse(response.body)

    expect(response).to be_successful
    expect(response).to have_http_status(200)
    expect(results["data"]["attributes"]).to have_key("api_key")
  end
end
