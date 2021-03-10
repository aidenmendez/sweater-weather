require 'rails_helper'


RSpec.describe 'Forecast request' do
  describe '(happy path)' do
    it 'returns a forecast for a given location', :vcr do
      location = "austin,tx"
      get "/api/v1/forecast?location=#{location}"

      data = JSON.parse(response.body)["data"]

      expect(data["id"]).to be_nil
      expect(data["type"]).to eq("forecast")
      expect(data["attributes"]["current_weather"]["datetime"]).to be_a(String)
      expect(data["attributes"]["current_weather"]["sunrise"]).to be_a(String)
      expect(data["attributes"]["current_weather"]["sunset"]).to be_a(String)
      expect(data["attributes"]["current_weather"]["temperature"]).to be_a(Numeric)
      expect(data["attributes"]["current_weather"]["feels_like"]).to be_a(Numeric)
      expect(data["attributes"]["current_weather"]["humidity"]).to be_a(Numeric)
      expect(data["attributes"]["current_weather"]["uvi"]).to be_a(Numeric)
      expect(data["attributes"]["current_weather"]["visibility"]).to be_a(Numeric)
      expect(data["attributes"]["current_weather"]["conditions"]).to be_a(String)
      expect(data["attributes"]["current_weather"]["icon"]).to be_a(String)

      expect(data["attributes"]["daily_weather"][0]["datetime"]).to be_a(String)
      expect(data["attributes"]["daily_weather"][0]["sunrise"]).to be_a(String)
      expect(data["attributes"]["daily_weather"][0]["sunset"]).to be_a(String)
      expect(data["attributes"]["daily_weather"][0]["max_temp"]).to be_a(Numeric)
      expect(data["attributes"]["daily_weather"][0]["min_temp"]).to be_a(Numeric)
      expect(data["attributes"]["daily_weather"][0]["conditions"]).to be_a(String)
      expect(data["attributes"]["daily_weather"][0]["icon"]).to be_a(String)

      expect(data["attributes"]["hourly_weather"][0]["datetime"]).to be_a(String)
      expect(data["attributes"]["hourly_weather"][0]["temperature"]).to be_a(Numeric)
      expect(data["attributes"]["hourly_weather"][0]["conditions"]).to be_a(String)
      expect(data["attributes"]["hourly_weather"][0]["icon"]).to be_a(String)
    end
  end
  describe '(sad path)' do
    it 'returns an error when no location is given', :vcr do
      location = nil
      get "/api/v1/forecast?location=#{location}"

      expect(response.status).to eq(400)
    end

    it "returns an error if location can't be found" do
      location = "adfavcagdgawegfbfharewagrrg"
      get "/api/v1/forecast?location=#{location}"
      
      expect(response.status).to eq(400)
    end
  end
end