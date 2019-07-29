require "rails_helper"

describe 'user can post email and password', type: :request do
  it 'to create an account' do
    body = {"email": "whatever@example.com", "password": "password", "password_confirmation": "password" }
    post '/api/v1/users', :params => body

    results = JSON.parse(response.body)

    latest_user = User.last
    expect(latest_user.email).to eq("whatever@example.com")
    expect(response).to be_successful
    expect(response).to have_http_status(201)
    expect(results["data"]["attributes"]).to have_key("api_key")
  end
end
