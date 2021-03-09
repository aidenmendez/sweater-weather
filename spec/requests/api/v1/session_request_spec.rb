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
      expect(data[:id]).to eq(user.id.to_s)
      expect(data[:attributes][:email]).to eq(user.email)
      expect(data[:attributes][:api_key]).to eq(user.api_key)  
    end
  end

  describe "(sad path)" do
    it "returns an error message that credentials are incorrect if password is wrong" do
      user = User.create!({
        :email => "whatever@example.com",
        :password => "password",
        :password_confirmation => "password"
        })

      req_data = {
        "email": "whatever@example.com",
        "password": "solarwinds123",
      }
  
      post "/api/v1/sessions", :params => req_data

      error_message = JSON.parse(response.body, symbolize_names: true)[:error][:message]

      expect(response.status).to eq(400)
      expect(error_message).to eq("Incorrect credentials") 
    end

    it "returns an error message that credentials are incorrect if email doesn't exist" do
      user = User.create!({
        :email => "whatever@example.com",
        :password => "password",
        :password_confirmation => "password"
        })

      req_data = {
        "email": "new_email@example.com",
        "password": "password",
      }
  
      post "/api/v1/sessions", :params => req_data

      error_message = JSON.parse(response.body, symbolize_names: true)[:error][:message]

      expect(response.status).to eq(400)
      expect(error_message).to eq("Incorrect credentials") 
    end
  end
end