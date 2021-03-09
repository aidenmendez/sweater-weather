require 'rails_helper'

describe "Session request" do
  describe "(happy path)" do
    it "returns email and api key-- status 200" do
      user = User.create!({
        :email => "whatever@example.com",
        :password => "password",
        :password_confirmation => "password"
        })

      req_data = {
        "email": "whatever@example.com",
        "password": "password",
      }
  
      post "/api/v1/sessions", :params => req_data

      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response.status).to eq(200)
      expect(data[:type]).to eq("user")
      expect(data[:id]).to be_an(user.id)
      expect(data[:attributes][:email]).to eq(user.email)
      expect(data[:attributes][:api_key]).to eq(user.api_key)  
    end
  end
end