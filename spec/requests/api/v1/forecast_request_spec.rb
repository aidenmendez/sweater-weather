require 'rails_helper'


RSpec.describe 'Forecast request' do
  describe '(happy path)' do
    it 'returns a forecast for a given location' do
      location = "austin,tx"
      get "/api/v1/forecast?location=#{location}"
      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(data[:id]).to eq(nil)
      expect(data[:type]).to eq(:forecast)
      expect(data[:attributes][:current_weather][:datetime]).to be_a(String)
      expect(data[:attributes][:current_weather][:sunrise]).to be_a(String)
      expect(data[:attributes][:current_weather][:sunset]).to be_a(String)
      expect(data[:attributes][:current_weather][:temperature]).to be_a(Float)
      expect(data[:attributes][:current_weather][:feels_like]).to be_a(Float)
      expect(data[:attributes][:current_weather][:humidity]).to be_a(Numeric)
      expect(data[:attributes][:current_weather][:uvi]).to be_a(Numeric)
      expect(data[:attributes][:current_weather][:visibility]).to be_a(Numeric)
      expect(data[:attributes][:current_weather][:conditions]).to be_a(String)
      expect(data[:attributes][:current_weather][:icon]).to be_a(String)

      expect(data[:attributes][:daily_weather][:date]).to be_a(String)
      expect(data[:attributes][:daily_weather][:sunrise]).to be_a(String)
      expect(data[:attributes][:daily_weather][:max_temp]).to be_a(Float)
      expect(data[:attributes][:daily_weather][:min_temp]).to be_a(Float)
      expect(data[:attributes][:daily_weather][:conditions]).to be_a(String)
      expect(data[:attributes][:daily_weather][:icon]).to be_a(String)

      expect(data[:attributes][:hourly_weather][:time]).to be_a(String)
      expect(data[:attributes][:hourly_weather][:temperature]).to be_a(Float)
      expect(data[:attributes][:hourly_weather][:conditions]).to be_a(String)
      expect(data[:attributes][:hourly_weather][:icon]).to be_a(String)
    end
  end
  describe '(sad path)' do
    
  end
end