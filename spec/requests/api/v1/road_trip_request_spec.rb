require 'rails_helper'

describe "Road trip request" do
  describe "(happy path)" do
    it "should return a json with travel and weather data" do
      user = User.create!({
        :email => "whatever@example.com",
        :password => "password",
        :password_confirmation => "password"
        })
      
      req_data = {
        "origin": "Denver,CO",
        "destination": "Pueblo,CO",
        "api_key": user.api_key
      }

      post "/api/v1/road_trip", :params => req_data

      data = JSON.parse(response.body, symbolize_names: true)[:data]

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

  end
end