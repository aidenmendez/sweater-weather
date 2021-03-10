require 'rails_helper'

describe "Road trip request" do
  describe "(happy path)" do
    it "should return a json with travel and weather data", :vcr do
      user = User.create!({
        :email                  => "whatever@example.com",
        :password               => "password",
        :password_confirmation  => "password"
      })
      
      req_data = {
        "origin": "Denver,CO",
        "destination": "Pueblo,CO",
        "api_key": user.api_key
      }

      post "/api/v1/road_trip", :params => req_data

      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response.status).to eq(201)
      expect(data[:id]).to be_nil
      expect(data[:type]).to eq("roadtrip")
      expect(data[:attributes][:start_city]).to eq("Denver, CO")
      expect(data[:attributes][:end_city]).to eq("Pueblo, CO")
      expect(data[:attributes][:travel_time]).to be_a(String)
      expect(data[:attributes][:weather_at_eta][:temperature]).to be_a(Numeric)
      expect(data[:attributes][:weather_at_eta][:conditions]).to be_a(String)
    end
  end

  describe "(sad path)" do
    it "should return a 401 response if API key is missing" do
      user = User.create!({
        :email                  => "whatever@example.com",
        :password               => "password",
        :password_confirmation  => "password"
      })
      
      req_data = {
        "origin": "Denver,CO",
        "destination": "Pueblo,CO"
      }

      post "/api/v1/road_trip", :params => req_data

      error = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(401)
      expect(error[:error][:message]).to eq("Unauthorized. Invalid or missing API key.")
    end

    it "should return a 401 response if API key is incorrect" do
      user = User.create!({
        :email                  => "whatever@example.com",
        :password               => "password",
        :password_confirmation  => "password"
      })
      
      req_data = {
        "origin": "Denver,CO",
        "destination": "Pueblo,CO",
        "api_key": "fake_api_key"
      }

      post "/api/v1/road_trip", :params => req_data

      error = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(401)
      expect(error[:error][:message]).to eq("Unauthorized. Invalid or missing API key.")
    end

    it "should return a travel time of impossible and weather should be empty", :vcr do
      user = User.create!({
        :email                  => "whatever@example.com",
        :password               => "password",
        :password_confirmation  => "password"
      })
      
      req_data = {
        "origin": "Denver,CO",
        "destination": "Paris, France",
        "api_key": user.api_key
      }

      post "/api/v1/road_trip", :params => req_data

      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response.status).to eq(201)
      expect(data[:id]).to be_nil
      expect(data[:type]).to eq("roadtrip")
      expect(data[:attributes][:start_city]).to eq("Denver,CO")
      expect(data[:attributes][:end_city]).to eq("Paris, France")
      expect(data[:attributes][:travel_time]).to eq("impossible")
      expect(data[:attributes][:weather_at_eta]).to be_a(Hash)
      expect(data[:attributes][:weather_at_eta][:temperature]).to be_nil
      expect(data[:attributes][:weather_at_eta][:conditions]).to be_nil
    end
  end
end