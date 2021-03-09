require 'rails_helper'

describe "Registration request" do
  describe "(happy path)" do
    it "returns a unique API key for a new user" do
      req_data = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      }
  
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
      req_data = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "Password"
      }
  
      post "/api/v1/users", :params => req_data

      error_message = JSON.parse(response.body, symbolize_names: true)[:error][:message]

      expect(response.status).to eq(400)
      expect(error_message).to eq("Passwords don't match")
    end

    it "returns a 400 response when email is already taken" do
      User.create!({
        :email => "whatever@example.com",
        :password => "password",
        :password_confirmation => "password"
        })

      req_data = {
        "email": "whatever@example.com",
        "password": "password3",
        "password_confirmation": "password3"
      }
  
      post "/api/v1/users", :params => req_data

      error_message = JSON.parse(response.body, symbolize_names: true)[:error][:message]

      expect(response.status).to eq(400)
      expect(error_message).to eq("Email already taken")
    end

    it "returns a 400 response when a password field is missing" do
      req_data = {
        "email": "whatever@example.com",
        "password": "password3"
      }
  
      post "/api/v1/users", :params => req_data
  
      error_message = JSON.parse(response.body, symbolize_names: true)[:error][:message]

      expect(response.status).to eq(400)
      expect(error_message).to eq("Passwords don't match")
    end
    
    it "returns a 400 response when the email is missing" do
      req_data = {
        "password": "password3",
        "password_confirmation": "password3"
      }
  
      post "/api/v1/users", :params => req_data

      error_message = JSON.parse(response.body, symbolize_names: true)[:error][:message]
  
      expect(response.status).to eq(400)
      expect(error_message).to eq("Something went wrong")
    end
  end
end