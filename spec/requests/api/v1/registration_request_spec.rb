require 'rails_helper'

describe "Registration request" do
  describe "(happy path)" do
    it "returns a unique API key for a new user" do
      req_data = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      }
  
      # post api_v1_registration_index_path(req_data.to_json)
      post "/api/v1/users", :params => req_data

      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response.status).to eq(201)
      expect(data[:type]).to eq("user")
      expect(data[:id]).to be_an(String)
      expect(data[:attributes][:email]).to be_a(String)
      expect(data[:attributes][:api_key]).to be_a(String)  
    end
  end

  describe "(sad path)" do
    it "returns a 400 response when passwords don't match" do

    end

    it "returns a 400 response when email is already taken" do
      
    end

    it "returns a 400 response when a password field is missing" do
      
    end

    it "returns a 400 response when the email is missing" do
      
    end
  end
end